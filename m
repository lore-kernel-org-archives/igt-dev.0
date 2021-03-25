Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 25 Mar 2021 17:39:31 -0000
Message-ID: <161669397179.15545.15066890293552373140@emeril.freedesktop.org>
References: <20210324183008.18170-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210324183008.18170-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_use_flipping_instead_of_frontbuffer_=28re?=
 =?utf-8?b?djIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0336262180=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0336262180==
Content-Type: multipart/alternative;
 boundary="===============4484843682274368007=="

--===============4484843682274368007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: use flipping instead of frontbuffer (rev2)
URL   : https://patchwork.freedesktop.org/series/88365/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9892_full -> IGTPW_5658_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5658_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5658_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5658_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@gem_userptr_blits@create-destroy-unsync.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_pm_dc@dc9-dpms}:
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html

  * {igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen}:
    - shard-tglb:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen.html

  
Known issues
------------

  Here are the changes found in IGTPW_5658_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1888] / [i915#3160])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_create@create-clear.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk1/igt@gem_create@create-clear.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#2389])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][19] ([i915#2389]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2389]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#118] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_exec_whisper@basic-fds-priority.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#2190])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][24] ([i915#2658]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#768])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271]) +377 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][28] ([i915#2724])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb5/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][29] ([i915#3295])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@gem_userptr_blits@vma-merge.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][30] ([i915#3295])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_userptr_blits@vma-merge.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][31] ([i915#3295])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@gem_userptr_blits@vma-merge.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][32] ([i915#3295])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109289]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271]) +38 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk7/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          NOTRUN -> [FAIL][35] ([i915#3296])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gen9_exec_parse@bb-large.html
    - shard-kbl:          NOTRUN -> [FAIL][36] ([i915#3296])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl7/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#112306])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#1937])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         NOTRUN -> [WARN][39] ([i915#1804] / [i915#2684])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109293] / [fdo#109506])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109506] / [i915#2411])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109302])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb5/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][43] -> [INCOMPLETE][44] ([i915#2782])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-snb7/igt@i915_selftest@live@hangcheck.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#1769])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#1769])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111614])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111615]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#110723])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@kms_chamelium@hdmi-hpd.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [i915#1149]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_color@pipe-d-degamma.html
    - shard-tglb:         NOTRUN -> [FAIL][57] ([i915#1149])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_color@pipe-d-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][60] ([i915#1319]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109279]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271]) +84 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#72])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][67] ([IGT#6])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][68] -> [FAIL][69] ([i915#52] / [i915#54]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          NOTRUN -> [FAIL][70] ([i915#52] / [i915#54])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109274]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2587])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2642])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2642])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2642])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][76] ([i915#2641])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111825]) +14 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +19 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#533]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][83] ([i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278]) +12 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2733])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2733])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#658]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#658]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([fdo#109441]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109441]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][94] ([i915#31])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][95] -> [DMESG-WARN][96] ([i915#180] / [i915#295])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-wait-forked-busy:
    - shard-kbl:          [PASS][97] -> [DMESG-WARN][98] ([i915#62])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl3/igt@kms_vblank@pipe-c-wait-forked-busy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl2/igt@kms_vblank@pipe-c-wait-forked-busy.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#533]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#533])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2437])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#2530]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@nouveau_crc@pipe-b-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2530]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109289]) +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271]) +236 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109291]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_test@nv_i915_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109291]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@prime_nv_test@nv_i915_sharing.html

  * igt@sysfs_clients@fair-3:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#2994])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@sema-50:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#2994]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [TIMEOUT][110] ([i915#2918]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][112] ([i915#2842]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][114] ([i915#2842]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk4/igt@gem_exec_fair@basic-none@rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][118] ([i915#2842]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][120] ([i915#118] / [i915#95]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk1/igt@gem_exec_whisper@basic-fds-priority-all.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk9/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [INCOMPLETE][122] ([i915#1895] / [i915#2405]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][124] ([i915#2190]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-glk:          [FAIL][126] ([i915#307]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_mmap_gtt@big-copy.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk2/igt@gem_mmap_gtt@big-copy.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][130] ([i915#52] / [i915#54]) -> [PASS][131] +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][132] ([i915#180]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][134] ([fdo#109441]) -> [PASS][135] +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-apl:          [FAIL][136] -> [FAIL][137] ([i915#2389])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl2/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/index.html

--===============4484843682274368007==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: use flipping instead of frontbuffer (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88365/">https://patchwork.freedesktop.org/series/88365/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9892_full -&gt; IGTPW_5658_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5658_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5658_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5658_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@i915_pm_dc@dc9-dpms}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@i915_pm_dc@dc9-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5658_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_create@create-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk1/igt@gem_create@create-clear.html">FAIL</a> ([i915#1888] / [i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +377 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb5/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#3295])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk8/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#3295])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#3295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#3295])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk7/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109271]) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl7/igt@gen9_exec_parse@bb-large.html">FAIL</a> ([i915#3296])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb5/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-snb7/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@kms_chamelium@hdmi-audio-edid.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_chamelium@vga-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_color@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_color@pipe-d-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +84 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">FAIL</a> ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a> ([IGT#6])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html">FAIL</a> ([i915#52] / [i915#54]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([i915#2587])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> ([fdo#111825]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html">SKIP</a> ([fdo#109278]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-snb6/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl3/igt@kms_vblank@pipe-c-wait-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl2/igt@kms_vblank@pipe-c-wait-forked-busy.html">DMESG-WARN</a> ([i915#62])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk7/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb1/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb6/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109271]) +236 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_i915_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@prime_nv_test@nv_i915_sharing.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@sysfs_clients@fair-3.html">SKIP</a> ([i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb4/igt@sysfs_clients@sema-50.html">SKIP</a> ([i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> ([i915#2918]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk4/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk4/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl3/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk1/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk9/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html">INCOMPLETE</a> ([i915#1895] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb8/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@gem_mmap_gtt@big-copy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk2/igt@gem_mmap_gtt@big-copy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">FAIL</a> ([i915#52] / [i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9892/shard-apl2/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5658/shard-apl8/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4484843682274368007==--

--===============0336262180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0336262180==--
