Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 15 Feb 2021 16:53:58 -0000
Message-ID: <161340803850.26463.7848300439605202252@emeril.freedesktop.org>
References: <20210215143039.7062-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210215143039.7062-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?reduce_executions_time_on_multiplane_tests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2138208040=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2138208040==
Content-Type: multipart/alternative;
 boundary="===============8448495202427847749=="

--===============8448495202427847749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: reduce executions time on multiplane tests
URL   : https://patchwork.freedesktop.org/series/87097/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9776_full -> IGTPW_5509_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/index.html

Known issues
------------

  Here are the changes found in IGTPW_5509_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][1] ([fdo#109314])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][2] ([fdo#109314])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-hsw:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw2/igt@gem_ctx_persistence@engines-mixed.html
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][5] ([i915#2842])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#2842]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#112283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2389]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk9/igt@gem_exec_reloc@basic-wide-active@bcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2389]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2389]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - shard-glk:          [PASS][14] -> [DMESG-WARN][15] ([i915#1610] / [i915#2803])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk2/igt@gem_exec_schedule@u-fairslice@bcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk2/igt@gem_exec_schedule@u-fairslice@bcs0.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271]) +62 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl1/igt@gen7_exec_parse@basic-offset.html
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109289]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb5/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#112306]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb3/igt@gen9_exec_parse@bb-secure.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#112306])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#454])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#111644] / [i915#1397] / [i915#2411])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#110892])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109293] / [fdo#109506])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271]) +44 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111614]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#2705])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#2705]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#2705])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb7/igt@kms_big_joiner@basic.html
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#2705])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk1/igt@kms_big_joiner@basic.html
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#2705]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl3/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl7/igt@kms_chamelium@vga-hpd.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][34] ([i915#1149])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@kms_color@pipe-a-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][35] ([i915#1149])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb3/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][36] ([i915#1149] / [i915#315])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_color@pipe-b-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][37] ([i915#1149] / [i915#315])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-c-legacy-gamma-reset:
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#2964])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-apl:          [PASS][40] -> [FAIL][41] ([i915#2964])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#2964])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk2/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk4/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-hsw:          [PASS][44] -> [FAIL][45] ([i915#2964])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-hsw1/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw7/igt@kms_color@pipe-c-legacy-gamma-reset.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#1149])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-hsw:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb5/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb3/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@legacy:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111828])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-kbl:          [PASS][54] -> [FAIL][55] ([i915#54])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-apl:          [PASS][56] -> [FAIL][57] ([i915#54])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271]) +44 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-size-change:
    - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#54])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-size-change.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109279]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278]) +16 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge:
    - shard-hsw:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#533]) +7 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [PASS][66] -> [FAIL][67] ([i915#2370])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#533])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#533])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][71] ([i915#79])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-kbl:          [PASS][72] -> [DMESG-WARN][73] ([i915#180])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][74] -> [DMESG-WARN][75] ([i915#180]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][76] ([i915#180]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2642])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][78] ([i915#2641])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_flip_tiling@flip-to-yf-tiled:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111615]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@kms_flip_tiling@flip-to-yf-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-snb:          NOTRUN -> [SKIP][80] ([fdo#109271]) +37 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109280]) +16 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111825]) +22 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          NOTRUN -> [SKIP][83] ([fdo#109271]) +35 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109289]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#533])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][86] ([fdo#108145] / [i915#265]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#1836])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#1836])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#2920]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([i915#658]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#658]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk4/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109642] / [fdo#111068] / [i915#658])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][96] -> [SKIP][97] ([fdo#109441]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-hsw:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#1072])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw7/igt@kms_psr@psr2_sprite_plane_onoff.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109441])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-hsw:          NOTRUN -> [SKIP][100] ([fdo#109271] / [fdo#109289])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#2530]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2530]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109291]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109291]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][105] ([i915#2842]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-iclb:         [FAIL][107] ([i915#2842]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][109] ([i915#2842]) -> [PASS][110] +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][111] ([i915#2389]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_schedule@u-fairslice-all:
    - shard-iclb:         [DMESG-WARN][113] ([i915#2803]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb4/igt@gem_exec_schedule@u-fairslice-all.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@gem_exec_schedule@u-fairslice-all.html

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - shard-tglb:         [DMESG-WARN][115] ([i915#2803]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb2/igt@gem_exec_schedule@u-fairslice@vcs1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs1.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [WARN][117] ([i915#2681]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         [WARN][119] ([i915#1804] / [i915#2684]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][121] ([i915#1519]) -> [PASS][122] +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-hsw5/igt@i915_pm_rc6_residency@rc6-idle.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][123] ([i915#180]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][125] ([i915#2574]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][127] ([i915#155] / [i915#180] / [i915#636]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][129] ([fdo#109441]) -> [PASS][130] +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          [TIMEOUT][131] ([i915#1280]) -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          [DMESG-WARN][133] ([i915#180]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@perf_pmu@rc6-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl6/igt@perf_pmu@rc6-suspend.html

  * igt@sysfs_clients@recycle:
    - shard-snb:          [FAIL][135] ([i915#3028]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-snb4/igt@sysfs_clients@recycle.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb7/igt@sysfs_clients@recycle.html

  * {igt@sysfs_clients@recycle-many}:
    - shard-tglb:         [FAIL][137] ([i915#3028]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb2/igt@sysfs_clients@recycle-many.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10@vcs0:
    - shard-glk:          [SKIP][139] ([fdo#109271] / [i915#3026]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk3/igt@sysfs_clients@sema-10@vcs0.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk5/igt@sysfs_clients@sema-10@vcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][141] ([i915#1804] / [i915#2684]) -> [WARN][142] ([i915#2684])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][143] ([i915#1226]) -> [SKIP][144] ([fdo#109349])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][145] ([i915#658]) -> [SKIP][146] ([i915#2920]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-upd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/index.html

--===============8448495202427847749==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rotation_crc: reduce executions time on multiplane tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87097/">https://patchwork.freedesktop.org/series/87097/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9776_full -&gt; IGTPW_5509_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5509_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw2/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk9/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb6/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk2/igt@gem_exec_schedule@u-fairslice@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk2/igt@gem_exec_schedule@u-fairslice@bcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl1/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +62 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb5/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb3/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +44 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb7/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk1/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl3/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl7/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb3/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk2/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk4/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-hsw1/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_color@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb3/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html">SKIP</a> ([fdo#109271]) +44 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-size-change:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-size-change.html">FAIL</a> ([i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen.html">SKIP</a> ([fdo#109278]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html">SKIP</a> ([fdo#109271] / [i915#533]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">FAIL</a> ([i915#2370])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk1/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-to-yf-tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@kms_flip_tiling@flip-to-yf-tiled.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack.html">SKIP</a> ([fdo#111825]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk4/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw7/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> ([fdo#109271] / [i915#1072])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb4/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> ([fdo#109441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([fdo#109271] / [fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb6/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb7/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb3/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb1/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice-all:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb4/igt@gem_exec_schedule@u-fairslice-all.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb1/igt@gem_exec_schedule@u-fairslice-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb2/igt@gem_exec_schedule@u-fairslice@vcs1.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-hsw5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">TIMEOUT</a> ([i915#1280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk7/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-apl4/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-apl6/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-snb4/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-snb7/igt@sysfs_clients@recycle.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle-many}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-tglb2/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-tglb8/igt@sysfs_clients@recycle-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-glk3/igt@sysfs_clients@sema-10@vcs0.html">SKIP</a> ([fdo#109271] / [i915#3026]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-glk5/igt@sysfs_clients@sema-10@vcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> ([i915#1226]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9776/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5509/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-upd</p>
</li>
</ul>

</body>
</html>

--===============8448495202427847749==--

--===============2138208040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2138208040==--
