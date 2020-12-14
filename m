Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 14 Dec 2020 11:33:14 -0000
Message-ID: <160794559413.28164.18321315835185256312@emeril.freedesktop.org>
References: <20201214065711.9787-1-karthik.b.s@intel.com>
In-Reply-To: <20201214065711.9787-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?btests_for_HDCP_over_MST_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2042889090=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2042889090==
Content-Type: multipart/alternative;
 boundary="===============3981245002562840493=="

--===============3981245002562840493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add subtests for HDCP over MST (rev4)
URL   : https://patchwork.freedesktop.org/series/82987/
State : success

== Summary ==

CI Bug Log - changes from IGT_5892_full -> IGTPW_5284_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5284_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_content_protection@dp-mst-lic-type-1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb2/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-1.html

  
New tests
---------

  New tests have been introduced between IGT_5892_full and IGTPW_5284_full:

### New IGT tests (4) ###

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-type-0:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_5284_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#658])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb2/igt@feature_discovery@psr2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#1037] / [i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-tglb2/igt@gem_eio@in-flight-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb8/igt@gem_eio@in-flight-suspend.html
    - shard-hsw:          [PASS][7] -> [DMESG-WARN][8] ([i915#1037] / [i915#2637])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw4/igt@gem_eio@in-flight-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@gem_eio@in-flight-suspend.html
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#1037] / [i915#155])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl1/igt@gem_eio@in-flight-suspend.html
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1037] / [i915#2635])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-apl3/igt@gem_eio@in-flight-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl2/igt@gem_eio@in-flight-suspend.html
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1037] / [i915#2635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk2/igt@gem_eio@in-flight-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk5/igt@gem_eio@in-flight-suspend.html
    - shard-iclb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1037])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb3/igt@gem_eio@in-flight-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109283])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#2389])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][21] ([i915#2389])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk4/igt@gem_exec_whisper@basic-fds-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk6/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_sync@basic-store-all:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#118] / [i915#262] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk6/igt@gem_sync@basic-store-all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk3/igt@gem_sync@basic-store-all.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#112306])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb6/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][28] ([i915#2681] / [i915#2684])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb7/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> [WARN][29] ([i915#1804] / [i915#2684])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [PASS][30] -> [SKIP][31] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-kbl2/igt@i915_pm_rpm@drm-resources-equal.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-hsw:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw2/igt@i915_pm_rpm@drm-resources-equal.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([i915#579])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb6/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-glk:          [PASS][36] -> [SKIP][37] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-apl:          [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-apl8/igt@i915_pm_rpm@drm-resources-equal.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl2/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#579])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb5/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111615])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl8/igt@kms_chamelium@dp-crc-multiple.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk4/igt@kms_chamelium@dp-crc-multiple.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb3/igt@kms_chamelium@dp-crc-multiple.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-tglb:         NOTRUN -> [FAIL][46] ([i915#1149] / [i915#315])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb1/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl2/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:
    - shard-hsw:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw8/igt@kms_color_chamelium@pipe-c-ctm-blue-to-red.html

  * {igt@kms_content_protection@dp-mst-lic-type-0} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-snb7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * {igt@kms_content_protection@dp-mst-type-1} (NEW):
    - shard-hsw:          NOTRUN -> [SKIP][50] ([fdo#109271]) +9 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111828])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109279])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109279]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274] / [fdo#109278])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][55] -> [FAIL][56] ([i915#2370])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#49])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109280]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111825]) +13 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271]) +59 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][63] ([fdo#108145] / [i915#265])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-64:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +15 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl4/igt@kms_plane_cursor@pipe-d-overlay-size-64.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271]) +12 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk2/igt@kms_plane_cursor@pipe-d-overlay-size-64.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][66] -> [SKIP][67] ([fdo#109441]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109278]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#2530])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109291]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb5/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109291])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb5/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][72] ([i915#1436] / [i915#2295])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-kbl7/igt@i915_suspend@forcewake.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_3d:
    - shard-tglb:         [DMESG-WARN][75] ([i915#402]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-tglb6/igt@kms_3d.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb3/igt@kms_3d.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-apl:          [FAIL][77] ([i915#129]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-apl3/igt@kms_color@pipe-b-ctm-green-to-red.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl8/igt@kms_color@pipe-b-ctm-green-to-red.html
    - shard-kbl:          [FAIL][79] ([i915#129]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-kbl1/igt@kms_color@pipe-b-ctm-green-to-red.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl2/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [FAIL][81] ([i915#2346]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][83] ([i915#2055]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][85] ([i915#2122]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][87] ([fdo#109642] / [fdo#111068]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][91] ([i915#1542]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk7/igt@perf@polling-parameterized.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk1/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][93] ([i915#658]) -> [SKIP][94] ([i915#588])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][95] ([i915#1804] / [i915#2684]) -> [WARN][96] ([i915#2681] / [i915#2684])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][97] ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483]) -> ([FAIL][98], [FAIL][99]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-iclb7/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb6/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          [FAIL][100] ([i915#2295] / [i915#2722]) -> ([FAIL][101], [FAIL][102]) ([i915#1610] / [i915#1814] / [i915#2295] / [i915#2722])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-apl6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl7/igt@runner@aborted.html
    - shard-glk:          [FAIL][103] ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][104], [FAIL][105]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5892/shard-glk8/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk5/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2733]: https://gitlab.freedesktop.org/drm/intel/issues/2733
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5892 -> IGTPW_5284

  CI-20190529: 20190529
  CI_DRM_9478: 94cf3a4cc350324f21728c70954c46e535405c87 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5284: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/index.html
  IGT_5892: 5c4766f5c4ca896a4c7b61645ecca2b80546dc3b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/index.html

--===============3981245002562840493==
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
<tr><td><b>Series:</b></td><td>Add subtests for HDCP over MST (rev4)</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/82987/">https://patchwork.freedesktop.org/series/82987/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5284/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5892_full -&gt; IGTPW_5284_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5284=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-1} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-iclb2/igt@kms_content_protection@dp-mst-lic-t=
ype-1.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-tglb2/igt@kms_content_protection@dp-mst-lic-t=
ype-1.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5892_full and IGTPW_5284_full=
:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5284_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb8/igt@f=
eature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-tglb2/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb8/igt=
@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</=
a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-hsw4/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@g=
em_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl1/igt@g=
em_eio@in-flight-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-apl3/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl2/igt@g=
em_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-glk2/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk5/igt@g=
em_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-iclb3/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt=
@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1037">i915#1037</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-iclb7/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/sha=
rd-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@gem_exec_reloc@basic-many-active@v=
cs1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-glk4/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk6=
/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-store-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-glk6/igt@gem_sync@basic-store-all.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk3/igt@g=
em_sync@basic-store-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/262">i915#262</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-tglb6/igt@gen9_exec_parse@valid-registers.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112=
306">fdo#112306</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-tglb7/igt@i915_pm_rc6_residency@rc6-idle.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681=
">i915#2681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2684">i915#2684</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804=
">i915#1804</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2684">i915#2684</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-kbl2/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kbl4=
/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-hsw2/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-hsw6=
/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-icl=
b6/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-glk1/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-glk1=
/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-apl8/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl2=
/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-tglb5/igt@i915_pm_rpm@drm-resources-equal.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579=
">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-tglb2/igt@kms_big_fb@yf-tiled-addfb.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111615">f=
do#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-apl8/igt@kms_chamelium@dp-crc-multiple.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-glk4/igt@kms_chamelium@dp-crc-multiple.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-tglb3/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-iclb1/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-tglb1/igt@kms_color@pipe-b-ctm-0-25.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i9=
15#1149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-kbl2/igt@kms_color_chamelium@pipe-a-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-blue-to-red:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-hsw8/igt@kms_color_chamelium@pipe-c-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-0} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-snb7/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-1} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@kms_content_protection@dp-mst-type-=
1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-tglb5/igt@kms_content_protection@uevent.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11182=
8">fdo#111828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109279">fdo#109279</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/s=
hard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-iclb4/igt@kms_flip@2x-flip-vs-modeset-vs-han=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb=
-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5284/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-kbl3/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +59 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-overlay-size-64:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-apl4/igt@kms_plane_cursor@pipe-d-overlay-size=
-64.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +15 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-glk2/igt@kms_plane_cursor@pipe-d-overlay-size=
-64.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +12 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-icl=
b3/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-iclb3/igt@kms_vblank@pipe-d-ts-continuation-=
dpms-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-tglb5/igt@prime_nv_test@nv_write_i915_gtt_mma=
p_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109291">fdo#109291</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5284/shard-iclb5/igt@prime_nv_test@nv_write_i915_gtt_mma=
p_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5284/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-kbl7/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-kb=
l3/igt@i915_suspend@forcewake.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-tglb6/igt@kms_3d.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-tglb3/igt@kms_3d.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-apl3/igt@kms_color@pipe-b-ctm-green-to-red.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shar=
d-apl8/igt@kms_color@pipe-b-ctm-green-to-red.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-kbl1/igt@kms_color@pipe-b-ctm-green-to-red.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shar=
d-kbl2/igt@kms_color@pipe-b-ctm-green-to-red.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i91=
5#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5284/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i91=
5#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5284/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-glk5/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-=
a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5284/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible=
@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/sh=
ard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/s=
hard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-glk7/igt@perf@polling-parameterized.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-gl=
k1/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shar=
d-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5892/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#=
2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
284/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-iclb7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/sha=
rd-iclb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5284/shard-iclb1/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#=
1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295"=
>i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-apl6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shard-apl2/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5284/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722"=
>i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5892/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=
=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/shar=
d-glk5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5284/shard-glk5/igt@runner@aborted.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#181=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i9=
15#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/27=
22">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=
=3D202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5892 -&gt; IGTPW_5284</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9478: 94cf3a4cc350324f21728c70954c46e535405c87 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5284: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5284/index.htm=
l<br />
  IGT_5892: 5c4766f5c4ca896a4c7b61645ecca2b80546dc3b @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3981245002562840493==--

--===============2042889090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2042889090==--
