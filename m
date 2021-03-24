Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Mar 2021 22:03:43 -0000
Message-ID: <161662342322.19036.5154501349373693516@emeril.freedesktop.org>
References: <1616583722-31940-1-git-send-email-jigar.bhatt@intel.com>
In-Reply-To: <1616583722-31940-1-git-send-email-jigar.bhatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fdc=3A_Fix_misc_warnings?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0701767799=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0701767799==
Content-Type: multipart/alternative;
 boundary="===============7299409694427130040=="

--===============7299409694427130040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_dc: Fix misc warnings
URL   : https://patchwork.freedesktop.org/series/88384/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9889_full -> IGTPW_5655_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/index.html

Known issues
------------

  Here are the changes found in IGTPW_5655_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> [SKIP][1] ([fdo#109271]) +62 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk2/igt@feature_discovery@display-3x.html
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#1839])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@feature_discovery@display-3x.html
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb7/igt@feature_discovery@display-3x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#658]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#109314])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#109314])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#118] / [i915#95])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk4/igt@gem_exec_create@forked.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@gem_exec_create@forked.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][10] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#2849])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-kbl:          NOTRUN -> [TIMEOUT][21] ([i915#3183])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl2/igt@gem_exec_reloc@basic-parallel.html
    - shard-tglb:         NOTRUN -> [TIMEOUT][22] ([i915#3183])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@gem_exec_reloc@basic-parallel.html
    - shard-iclb:         NOTRUN -> [TIMEOUT][23] ([i915#3183])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gem_exec_reloc@basic-parallel.html
    - shard-glk:          NOTRUN -> [TIMEOUT][24] ([i915#3183])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1610])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl2/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#2428])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#768])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109312])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb7/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109312])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb2/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#110542])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gem_userptr_blits@coherency-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109290])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-snb:          NOTRUN -> [DMESG-WARN][34] ([i915#3002])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb5/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][35] ([fdo#109271]) +337 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#1699]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl3/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [INCOMPLETE][37] ([i915#2502] / [i915#2667])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl6/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][38] -> [INCOMPLETE][39] ([i915#155])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledx_blits:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109289]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@gen3_render_tiledx_blits.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109289]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb6/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#112306]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#112306]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#1937])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_selftest@live@client:
    - shard-glk:          [PASS][45] -> [DMESG-FAIL][46] ([i915#3047])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk6/igt@i915_selftest@live@client.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@i915_selftest@live@client.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111614]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#111615]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#2705])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl1/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@pipe-c-degamma:
    - shard-iclb:         NOTRUN -> [FAIL][54] ([i915#1149])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb7/igt@kms_color@pipe-c-degamma.html
    - shard-tglb:         NOTRUN -> [FAIL][55] ([i915#1149])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb1/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [i915#1149]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][60] ([i915#1319])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109279])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#109279]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278]) +10 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          NOTRUN -> [FAIL][65] ([i915#52] / [i915#54])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][66] -> [FAIL][67] ([i915#52] / [i915#54]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109274]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][69] ([i915#2122])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][70] -> [DMESG-WARN][71] ([i915#180])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [PASS][72] -> [DMESG-WARN][73] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-apl:          NOTRUN -> [FAIL][74] ([i915#2641])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111825]) +25 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [PASS][76] -> [FAIL][77] ([i915#49])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +17 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271]) +98 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#110577])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb2/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109310])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb7/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#533]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#533]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#533]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          NOTRUN -> [DMESG-WARN][85] ([i915#180] / [i915#533])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][86] ([fdo#108145] / [i915#265]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-glk:          NOTRUN -> [FAIL][89] ([i915#899])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2733])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#1836])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#1836])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658]) +7 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#658]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@kms_psr2_su@frontbuffer.html
    - shard-tglb:         NOTRUN -> [FAIL][96] ([i915#2596])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109642] / [fdo#111068] / [i915#658])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][98] -> [SKIP][99] ([fdo#109441]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109441]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271]) +235 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl7/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flip-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109502])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@kms_vrr@flip-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([fdo#109502])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2437]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2437])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2437])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2437])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-iclb:         NOTRUN -> [SKIP][108] ([i915#2437])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#2530])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2530])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb7/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][111] -> [FAIL][112] ([i915#1542])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-tglb6/igt@perf@polling-parameterized.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109291]) +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109291]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109295])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#109295])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@recycle:
    - shard-glk:          [PASS][117] -> [FAIL][118] ([i915#3028])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk8/igt@sysfs_clients@recycle.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          [PASS][119] -> [FAIL][120] ([i915#3028])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl8/igt@sysfs_clients@recycle-many.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         [PASS][121] -> [FAIL][122] ([i915#3028])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb6/igt@sysfs_clients@recycle-many.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          [PASS][123] -> [FAIL][124] ([i915#3028])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl7/igt@sysfs_clients@recycle-many.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl6/igt@sysfs_clients@recycle-many.html
    - shard-snb:          [PASS][125] -> [FAIL][126] ([i915#3028])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-snb6/igt@sysfs_clients@recycle-many.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10@vcs0:
    - shard-kbl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#3026]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl1/igt@sysfs_clients@sema-10@vcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@replace@vcs0:
    - shard-iclb:         [FAIL][128] ([i915#2410]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb3/igt@gem_ctx_persistence@replace@vcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@gem_ctx_persistence@replace@vcs0.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][130] ([i915#2842]) -> [PASS][131] +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [FAIL][132] ([i915#2842]) -> [PASS][133] +3 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [FAIL][134] ([i915#2842]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk4/igt@gem_exec_fair@basic-none@vecs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][136] ([i915#2389]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - shard-kbl:          [DMESG-WARN][138] ([i915#1610] / [i915#2803]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs1.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs1.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [DMESG-WARN][140] ([i915#118] / [i915#95]) -> [PASS][141] +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [INCOMPLETE][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl3/igt@gem_workarounds@suspend-resume-context.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/index.html

--===============7299409694427130040==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_dc: Fix misc warnings</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88384/">https://patchwork.freedesktop.org/series/88384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9889_full -&gt; IGTPW_5655_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5655_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk2/igt@feature_discovery@display-3x.html">SKIP</a> ([fdo#109271]) +62 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb7/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk4/igt@gem_exec_create@forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@gem_exec_create@forked.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl2/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl2/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#1610])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">FAIL</a> ([i915#2428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb7/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb5/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +337 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl3/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl6/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb6/igt@gen3_render_tiledx_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk6/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@i915_selftest@live@client.html">DMESG-FAIL</a> ([i915#3047])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl1/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@kms_chamelium@dp-hpd-storm.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb7/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb1/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> ([fdo#109278]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">FAIL</a> ([i915#52] / [i915#54]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb8/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-tglb8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> ([fdo#111825]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +98 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb2/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb7/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#180] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-none.html">FAIL</a> ([i915#899])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@kms_psr2_su@frontbuffer.html">FAIL</a> ([i915#2596])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb1/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl7/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +235 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb3/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb7/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-tglb6/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb5/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb8/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk8/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl8/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-apl2/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb6/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb4/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl7/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl6/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-snb6/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-snb6/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl1/igt@sysfs_clients@sema-10@vcs0.html">SKIP</a> ([fdo#109271] / [i915#3026]) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@replace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-iclb3/igt@gem_ctx_persistence@replace@vcs0.html">FAIL</a> ([i915#2410]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-iclb6/igt@gem_ctx_persistence@replace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk4/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs1.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5655/shard-glk9/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9889/shard-apl3/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_">PASS</a></li>
</ul>
</li>
</ul>

</body>
</html>

--===============7299409694427130040==--

--===============0701767799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0701767799==--
