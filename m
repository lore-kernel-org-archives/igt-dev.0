Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Feb 2021 07:53:12 -0000
Message-ID: <161242519211.4501.16313275605628802818@emeril.freedesktop.org>
References: <20210204040934.19488-1-karthik.b.s@intel.com>
In-Reply-To: <20210204040934.19488-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?btests_for_HDCP_over_MST_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0608076001=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0608076001==
Content-Type: multipart/alternative;
 boundary="===============7488836926086198646=="

--===============7488836926086198646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add subtests for HDCP over MST (rev5)
URL   : https://patchwork.freedesktop.org/series/82987/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9728_full -> IGTPW_5476_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5476_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_content_protection@dp-mst-lic-type-1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * {igt@kms_content_protection@dp-mst-type-0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@kms_content_protection@dp-mst-type-0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9728_full and IGTPW_5476_full:

### New IGT tests (4) ###

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-type-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5476_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb4/igt@gem_ctx_persistence@clone.html
    - shard-hsw:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw2/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [PASS][5] -> [TIMEOUT][6] ([i915#2918])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-kbl:          NOTRUN -> [TIMEOUT][13] ([i915#1729])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@gem_exec_reloc@basic-parallel.html
    - shard-apl:          NOTRUN -> [TIMEOUT][14] ([i915#1729])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][15] ([i915#2389]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2389])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][19] ([i915#2658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#768])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#1699]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl3/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][22] ([i915#2502] / [i915#2667])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl1/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          NOTRUN -> [DMESG-WARN][23] ([i915#180])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109289])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#112306])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#112306]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#2856])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][31] -> [WARN][32] ([i915#1519])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109302])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@i915_query@query-topology-unsupported.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         NOTRUN -> [FAIL][34] ([i915#2597])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111614])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111615]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb1/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][40] ([i915#1149])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb2/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
    - shard-hsw:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * {igt@kms_content_protection@dp-mst-type-1} (NEW):
    - shard-hsw:          NOTRUN -> [SKIP][46] ([fdo#109271]) +41 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][47] ([i915#1319])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][48] ([i915#1319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-random:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#54])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
    - shard-apl:          [PASS][51] -> [FAIL][52] ([i915#54])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][53] ([i915#180])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109279]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271]) +55 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][59] -> [FAIL][60] ([i915#2598])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#2672])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#2642])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#2642])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2642])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-kbl:          NOTRUN -> [FAIL][65] ([i915#2641])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +6 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111825]) +28 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271]) +24 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271]) +178 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#1839]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#1839])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#533])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][73] -> [DMESG-WARN][74] ([i915#180]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][77] ([fdo#108145] / [i915#265]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#112054])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2920]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk7/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html

  * igt@kms_psr@psr2_dpms:
    - shard-hsw:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#1072])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw1/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([fdo#109441]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][87] ([IGT#2])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-wait-forked-busy:
    - shard-hsw:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#533]) +4 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw4/igt@kms_vblank@pipe-d-wait-forked-busy.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271]) +149 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl7/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2437])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2437])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2437])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2530])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@perf@blocking:
    - shard-hsw:          [PASS][94] -> [SKIP][95] ([fdo#109271])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-hsw1/igt@perf@blocking.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw1/igt@perf@blocking.html
    - shard-glk:          [PASS][96] -> [SKIP][97] ([fdo#109271] / [i915#1354])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk4/igt@perf@blocking.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk2/igt@perf@blocking.html
    - shard-tglb:         [PASS][98] -> [SKIP][99] ([i915#1354])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb8/igt@perf@blocking.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb3/igt@perf@blocking.html
    - shard-apl:          [PASS][100] -> [SKIP][101] ([fdo#109271] / [i915#1354])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl7/igt@perf@blocking.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@perf@blocking.html
    - shard-iclb:         [PASS][102] -> [SKIP][103] ([i915#1354])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb8/igt@perf@blocking.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@perf@blocking.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#112283])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109291]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@prime_nv_test@i915_import_pread_pwrite.html
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109291])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb1/igt@prime_nv_test@i915_import_pread_pwrite.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][107] ([i915#2842]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][109] ([i915#2842]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [FAIL][111] ([i915#2842]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb6/igt@gem_exec_fair@basic-pace@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@gem_exec_fair@basic-pace@rcs0.html
    - shard-glk:          [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][115] ([i915#180]) -> [PASS][116] +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-kbl:          [INCOMPLETE][117] ([i915#151] / [i915#155]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_color@pipe-b-legacy-gamma-reset:
    - shard-apl:          [FAIL][119] ([i915#2964]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl7/igt@kms_color@pipe-b-legacy-gamma-reset.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl4/igt@kms_color@pipe-b-legacy-gamma-reset.html
    - shard-kbl:          [FAIL][121] ([i915#2964]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma-reset.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma-reset.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][123] ([i915#2370]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][125] ([i915#79]) -> [PASS][126] +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][127] ([i915#180]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@sysfs_clients@recycle}:
    - shard-snb:          [FAIL][129] ([i915#3028]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-snb4/igt@sysfs_clients@recycle.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb6/igt@sysfs_clients@recycle.html
    - shard-iclb:         [FAIL][131] ([i915#3028]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb8/igt@sysfs_clients@recycle.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb7/igt@sysfs_clients@recycle.html
    - shard-apl:          [FAIL][133] ([i915#3028]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl4/igt@sysfs_clients@recycle.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@sysfs_clients@recycle.html
    - shard-tglb:         [FAIL][135] ([i915#3028]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb7/igt@sysfs_clients@recycle.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@sysfs_clients@recycle.html

  * {igt@sysfs_clients@recycle-many}:
    - shard-apl:          [FAIL][137] -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl3/igt@sysfs_clients@recycle-many.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl7/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         [FAIL][139] -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb4/igt@sysfs_clients@recycle-many.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb4/igt@sysfs_clients@recycle-many.html
    - shard-glk:          [FAIL][141] -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk1/igt@sysfs_clients@recycle-many.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk8/igt@sysfs_clients@recycle-many.html
    - shard-tglb:         [FAIL][143] -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb7/igt@sysfs_clients@recycle-many.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_hear

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/index.html

--===============7488836926086198646==
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
<tr><td><b>Series:</b></td><td>Add subtests for HDCP over MST (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82987/">https://patchwork.freedesktop.org/series/82987/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9728_full -&gt; IGTPW_5476_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5476_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9728_full and IGTPW_5476_full:</p>
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
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5476_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb4/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099])</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw2/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk9/igt@gem_ctx_persistence@close-replace-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> ([i915#2918])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#1729])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#1729])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl3/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl1/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1519])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@kms_chamelium@dp-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb1/igt@kms_chamelium@dp-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb2/igt@kms_color_chamelium@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-1} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([fdo#109271]) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl4/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-256x256-right-edge.html">SKIP</a> ([fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([fdo#109271]) +55 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html">SKIP</a> ([fdo#111825]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109271]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +178 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk7/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw1/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109271] / [i915#1072])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl2/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-busy:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw4/igt@kms_vblank@pipe-d-wait-forked-busy.html">SKIP</a> ([fdo#109271] / [i915#533]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl7/igt@kms_vblank@pipe-d-wait-forked-hang.html">SKIP</a> ([fdo#109271]) +149 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb8/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@nouveau_crc@pipe-c-source-outp-inactive.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@blocking:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-hsw1/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw1/igt@perf@blocking.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk4/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk2/igt@perf@blocking.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb8/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb3/igt@perf@blocking.html">SKIP</a> ([i915#1354])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl7/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl8/igt@perf@blocking.html">SKIP</a> ([fdo#109271] / [i915#1354])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb8/igt@perf@blocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@perf@blocking.html">SKIP</a> ([i915#1354])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@prime_nv_test@i915_import_pread_pwrite.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb1/igt@prime_nv_test@i915_import_pread_pwrite.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> ([i915#151] / [i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl7/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a> ([i915#2964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl4/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a> ([i915#2964]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle}:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-snb4/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-snb6/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb8/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb7/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl4/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl1/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb7/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb2/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle-many}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-apl3/igt@sysfs_clients@recycle-many.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-apl7/igt@sysfs_clients@recycle-many.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-iclb4/igt@sysfs_clients@recycle-many.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-iclb4/igt@sysfs_clients@recycle-many.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-glk1/igt@sysfs_clients@recycle-many.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-glk8/igt@sysfs_clients@recycle-many.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9728/shard-tglb7/igt@sysfs_clients@recycle-many.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5476/shard-tglb1/igt@sysfs_clients@recycle-many.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_hear</p>
</li>
</ul>

</body>
</html>

--===============7488836926086198646==--

--===============0608076001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0608076001==--
