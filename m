Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Feb 2021 10:33:38 -0000
Message-ID: <161243481841.4503.7335583573398214587@emeril.freedesktop.org>
References: <20210204080637.23939-1-karthik.b.s@intel.com>
In-Reply-To: <20210204080637.23939-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?btests_for_HDCP_over_MST_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1710777163=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1710777163==
Content-Type: multipart/alternative;
 boundary="===============4808917221467618713=="

--===============4808917221467618713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add subtests for HDCP over MST (rev6)
URL   : https://patchwork.freedesktop.org/series/82987/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9729_full -> IGTPW_5477_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5477_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5477_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5477_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-tglb1/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb7/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * {igt@kms_content_protection@dp-mst-lic-type-1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * {igt@kms_content_protection@dp-mst-type-0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@perf@stress-open-close:
    - shard-glk:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-glk1/igt@perf@stress-open-close.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk7/igt@perf@stress-open-close.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9729_full and IGTPW_5477_full:

### New IGT tests (4) ###

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_content_protection@dp-mst-type-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_content_protection@dp-mst-type-1:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5477_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-snb5/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-hsw:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw2/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][9] ([i915#1037] / [i915#180])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][10] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-glk4/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#768])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-glk:          NOTRUN -> [INCOMPLETE][17] ([i915#2502] / [i915#2667])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk3/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          NOTRUN -> [DMESG-WARN][18] ([i915#180])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109289])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109289])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb5/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#112306])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb5/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#2856])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb3/igt@gen9_exec_parse@shadow-peek.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb3/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][24] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#111644] / [i915#1397] / [i915#2411])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#110892])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109302])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109302])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb5/igt@i915_query@query-topology-unsupported.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#404])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#404])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111615]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109278] / [i915#1149])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
    - shard-hsw:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw2/igt@kms_color_chamelium@pipe-b-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-b-gamma:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl7/igt@kms_color_chamelium@pipe-b-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * {igt@kms_content_protection@dp-mst-type-1} (NEW):
    - shard-hsw:          NOTRUN -> [SKIP][43] ([fdo#109271]) +48 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#54])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#54])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-kbl:          NOTRUN -> [FAIL][50] ([i915#54])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-snb:          NOTRUN -> [SKIP][52] ([fdo#109271]) +46 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-snb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#533])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl2/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][55] -> [INCOMPLETE][56] ([i915#1602] / [i915#2411] / [i915#456])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][58] -> [FAIL][59] ([i915#2598])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180] / [i915#1982])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][62] -> [INCOMPLETE][63] ([i915#2055] / [i915#2295])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2642])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2642])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#2642])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-kbl:          NOTRUN -> [FAIL][67] ([i915#2641])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111825]) +17 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280]) +9 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271]) +38 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271]) +81 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +79 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][74] ([i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#112054])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2920]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#658]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109642] / [fdo#111068] / [i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@primary_page_flip:
    - shard-hsw:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#1072]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw4/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([fdo#109441])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109441])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb3/igt@kms_psr@psr2_dpms.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][89] ([IGT#2])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-wait-forked-busy:
    - shard-hsw:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#533]) +6 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw6/igt@kms_vblank@pipe-d-wait-forked-busy.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2437])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2437])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb6/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#2530])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@perf@short-reads:
    - shard-hsw:          [PASS][94] -> [FAIL][95] ([i915#51])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-hsw8/igt@perf@short-reads.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw1/igt@perf@short-reads.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#112283])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#112283])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_api@i915_nv_double_export:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109291]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@prime_nv_api@i915_nv_double_export.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109291]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb3/igt@prime_nv_test@i915_import_pread_pwrite.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][102] ([i915#2842]) -> [PASS][103] +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][104] ([i915#2849]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-apl:          [DMESG-WARN][106] ([i915#1610]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@i915_suspend@forcewake.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][110] ([i915#2370]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][112] ([fdo#109441]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * {igt@sysfs_clients@recycle}:
    - shard-hsw:          [FAIL][114] ([i915#3028]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-hsw7/igt@sysfs_clients@recycle.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw7/igt@sysfs_clients@recycle.html
    - shard-tglb:         [FAIL][116] ([i915#3028]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-tglb3/igt@sysfs_clients@recycle.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb2/igt@sysfs_clients@recycle.html

  * {igt@sysfs_clients@recycle-many}:
    - shard-kbl:          [FAIL][118] ([i915#3028]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@sysfs_clients@recycle-many.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl7/igt@sysfs_clients@recycle-many.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][120] ([i915#2681] / [i915#2684]) -> [WARN][121] ([i915#2684])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][122] ([i915#1226]) -> [SKIP][123] ([fdo#109349])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][124] ([i915#2920]) -> [SKIP][125] ([i915#658])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][126] ([i915#658]) -> [SKIP][127] ([i915#2920]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([i915#2295] / [i915#3002]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2295] / [i915#3002])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1610] / [i915#2295] / [i915#2426] / [i915#3002]) -> ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148]) ([fdo#109271] / [i915#1610] / [i915#1814] / [i915#2295] / [i915#3002])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl3/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl2/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl4/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl1/igt@runner@aborted.html
   [146]: https://intel

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/index.html

--===============4808917221467618713==
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
<tr><td><b>Series:</b></td><td>Add subtests for HDCP over MST (rev6)</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/82987/">https://patchwork.freedesktop.org/series/82987/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5477/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9729_full -&gt; IGTPW_5477_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5477_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5477_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5477=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-tglb1/igt@gem_exec_whisper@basic-contexts-priority-all.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5477/shard-tglb7/igt@gem_exec_whisper@basic-contexts-priority-all.html">=
INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-lic-type-1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb7/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-glk1/igt@perf@stress-open-close.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-glk7/igt@=
perf@stress-open-close.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9729_full and IGTPW_5477_f=
ull:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<p>Here are the changes found in IGTPW_5477_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-snb5/igt@gem_ctx_persistence@clone.html">SKI=
P</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-hsw2/igt@gem_ctx_persistence@legacy-engines-=
cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-apl1/igt@gem_eio@in-flight-suspend.html">DME=
SG-WARN</a> ([i915#1037] / [i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-glk4/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shar=
d-glk1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb7/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-kbl4/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@=
gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180]) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-glk3/igt@gem_userptr_blits@vma-merge.html">I=
NCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-apl1/igt@gem_workarounds@suspend-resume-fd.h=
tml">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb5/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb5/igt@gen9_exec_parse@basic-rejected.htm=
l">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb3/igt@gen9_exec_parse@shadow-peek.html">S=
KIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb3/igt@gen9_exec_parse@shadow-peek.html">S=
KIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>=
 ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@i9=
15_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb6/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb5/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb1/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_atomic@plane-primary-overlay-mu=
table-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb3/igt@kms_big_fb@yf-tiled-addfb.html">SK=
IP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-glk6/igt@kms_chamelium@dp-hpd-with-enabled-mo=
de.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_chamelium@dp-hpd-with-enabled-m=
ode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-green-to-red:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-hsw2/igt@kms_color_chamelium@pipe-b-ctm-gree=
n-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-gamma:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-apl7/igt@kms_color_chamelium@pipe-b-gamma.ht=
ml">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-0-5.=
html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-5.=
html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-max.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_content_protection@dp-mst-type-1} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-hsw8/igt@kms_content_protection@dp-mst-type-=
1.html">SKIP</a> ([fdo#109271]) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/s=
hard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i=
915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-random:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9729/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
477/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">FAIL</a=
> ([i915#54])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9729/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
477/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html">FAIL</a=
> ([i915#54])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-=
random.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x64=
-rapid-movement.html">SKIP</a> ([fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-snb7/igt@kms_cursor_legacy@2x-cursor-vs-flip=
-atomic.html">SKIP</a> ([fdo#109271]) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa=
-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-kbl2/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-tglb6=
/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1602] / [i915#24=
11] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@kms_flip@2x-modeset-vs-vblank-race=
-interruptible.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_547=
7/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i=
915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5477/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DM=
ESG-WARN</a> ([i915#180] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5477/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.=
html">INCOMPLETE</a> ([i915#2055] / [i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-kbl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([fdo#111825]) +17 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +9 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109271]) +38 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-apl2/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +81 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-kbl1/igt@kms_frontbuffer_tracking@psr-rgb101=
010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +79 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7=
efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7=
efc.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-t=
iling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb7/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-3.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-apl4/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-1=
.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
1.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-iclb6/igt=
@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#=
658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-hsw4/igt@kms_psr@primary_page_flip.html">SKI=
P</a> ([fdo#109271] / [i915#1072]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-ic=
lb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb3/igt@kms_psr@psr2_dpms.html">SKIP</a> (=
[fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-kbl2/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-busy:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-hsw6/igt@kms_vblank@pipe-d-wait-forked-busy.=
html">SKIP</a> ([fdo#109271] / [i915#533]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb4/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb6/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb6/igt@nouveau_crc@pipe-c-source-outp-ina=
ctive.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@short-reads:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-hsw8/igt@perf@short-reads.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-hsw1/igt@perf=
@short-reads.html">FAIL</a> ([i915#51])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-iclb2/igt@perf_pmu@event-wait@rcs0.html">SKIP=
</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-tglb2/igt@perf_pmu@event-wait@rcs0.html">SKIP=
</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb8/igt@prime_nv_api@i915_nv_double_export=
.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-tglb3/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5477/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5477/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5477/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-=
WARN</a> ([i915#1610]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5477/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-kbl4/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i=
915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
477/shard-kbl2/igt@i915_suspend@forcewake.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">F=
AIL</a> ([i915#2370]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5477/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb7/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#1094=
41]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/s=
hard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle}:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9729/shard-hsw7/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028=
]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/sha=
rd-hsw7/igt@sysfs_clients@recycle.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9729/shard-tglb3/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#302=
8]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/sh=
ard-tglb2/igt@sysfs_clients@recycle.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle-many}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-kbl4/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i91=
5#3028]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_54=
77/shard-kbl7/igt@sysfs_clients@recycle-many.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 ([i915#2681] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5477/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html=
">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> ([i915#1226]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5477/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</=
a> ([fdo#109349])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
-3.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5477/shard-iclb3/igt@kms_psr2_sf@overlay-primary-updat=
e-sf-dmg-area-3.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
-4.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5477/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9729/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_97=
29/shard-kbl2/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#3002]=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/sha=
rd-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5477/shard-kbl1/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-kbl4/igt@ru=
nner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9729/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9729/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9729/shard-apl2/igt@runner@aborted.ht=
ml">FAIL</a>) ([i915#1610] / [i915#2295] / [i915#2426] / [i915#3002]) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl1=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5477/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5477/shard-apl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5477/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel">FAIL</a>, [FAIL][147], [FAIL][148]) ([fdo#109271] / [i915#161=
0] / [i915#1814] / [i915#2295] / [i915#3002])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4808917221467618713==--

--===============1710777163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1710777163==--
