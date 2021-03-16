Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 16 Mar 2021 10:09:25 -0000
Message-ID: <161588936583.23909.1658717122168312518@emeril.freedesktop.org>
References: <20210315152243.1500889-1-mail@aurabindo.in>
In-Reply-To: <20210315152243.1500889-1-mail@aurabindo.in>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Add_test_description_for_amd=5Fabm?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1724660420=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Aurabindo Pillai <mail@aurabindo.in>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1724660420==
Content-Type: multipart/alternative;
 boundary="===============3100190964582925665=="

--===============3100190964582925665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Add test description for amd_abm
URL   : https://patchwork.freedesktop.org/series/88002/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9859_full -> IGTPW_5605_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/index.html

Known issues
------------

  Here are the changes found in IGTPW_5605_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][1] ([i915#1839])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@feature_discovery@display-4x.html
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#1839])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([fdo#109314])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb8/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][4] ([fdo#109314])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][6] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk1/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][7] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2849])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2389])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2389])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#1610] / [i915#2803])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-apl:          [PASS][24] -> [DMESG-WARN][25] ([i915#1610])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl6/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#118] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-iclb:         [PASS][28] -> [INCOMPLETE][29] ([i915#1895])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#307])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][32] ([i915#2658])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb5/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#768]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#1317]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271]) +113 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl1/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#1317]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271]) +101 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk7/igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#1699]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#1704]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#1704]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [INCOMPLETE][42] ([i915#2502] / [i915#2667])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109289]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#112306]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#112306])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][46] -> [WARN][47] ([i915#2681])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         [PASS][48] -> [WARN][49] ([i915#1804] / [i915#2684])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111614]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#110723])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#2705])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl7/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271]) +417 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb5/igt@kms_ccs@pipe-a-ccs-on-another-bo.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb1/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +27 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-a-ctm-0-25:
    - shard-tglb:         NOTRUN -> [FAIL][59] ([i915#1149] / [i915#315]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_color@pipe-a-ctm-0-25.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][60] ([i915#1149] / [i915#315]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [i915#1149]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][65] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][66] ([i915#2105])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][68] -> [DMESG-WARN][69] ([i915#180]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109279]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][72] ([IGT#6])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         NOTRUN -> [FAIL][73] ([i915#2346])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_dsc@basic-dsc-enable-dp:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109349])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_dp_dsc@basic-dsc-enable-dp.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109349])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-dp.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb8/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111825]) +34 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][78] ([i915#2122])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][79] -> [FAIL][80] ([i915#2598])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][81] -> [DMESG-WARN][82] ([i915#180]) +7 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2642])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-kbl:          NOTRUN -> [FAIL][84] ([i915#2641])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +24 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271]) +205 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#1187]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#1187])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109289]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#533]) +4 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#533]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278]) +12 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb8/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#533])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][94] ([i915#265])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][95] ([fdo#108145] / [i915#265]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk9/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][96] ([fdo#108145] / [i915#265])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-y:
    - shard-iclb:         NOTRUN -> [FAIL][97] ([i915#1779])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_plane_multiple@atomic-pipe-c-tiling-y.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#658]) +6 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#658]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#2920])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#658]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][103] -> [SKIP][104] ([fdo#109441]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109441])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#2437])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2437])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2437])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2437])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#2530]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@nouveau_crc@pipe-b-source-outp-inactive.html
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#2530]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][113] ([i915#180])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl3/igt@perf_pmu@rc6-suspend.html

  * igt@prime_nv_api@nv_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109291]) +3 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@prime_nv_api@nv_self_import.html

  * igt@prime_nv_test@nv_i915_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109291]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@prime_nv_test@nv_i915_sharing.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         [PASS][116] -> [FAIL][117] ([i915#3028])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb2/igt@sysfs_clients@recycle-many.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb1/igt@sysfs_clients@recycle-many.html
    - shard-tglb:         [PASS][118] -> [FAIL][119] ([i915#3028])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb2/igt@sysfs_clients@recycle-many.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@sysfs_clients@recycle-many.html
    - shard-snb:          NOTRUN -> [FAIL][120] ([i915#3028])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10@vecs0:
    - shard-apl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#3026])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@sysfs_clients@sema-10@vecs0.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][122] ([i915#2369] / [i915#3063]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb8/igt@gem_eio@unwedge-stress.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][124] ([i915#2842]) -> [PASS][125] +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-kbl:          [FAIL][126] ([i915#2842]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [FAIL][128] ([i915#2842]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - shard-glk:          [DMESG-WARN][132] ([i915#1610] / [i915#2803]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk9/igt@gem_exec_schedule@u-fairslice@vecs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@gem_exec_schedule@u-fairslice@vecs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][134] ([i915#307]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-glk:          [FAIL][136] ([i915#307]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@i915_selftest@live@client:
    - shard-glk:          [DMESG-FAIL][138] ([i915#3047]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk2/igt@i915_selftest@live@client.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk6/igt@i915_selftest@live@client.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][140] ([i915#180]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl4/igt@i915_suspend@forcewake.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][142] ([i915#2597]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb8/igt@kms_async_flips@test-time-stamp.

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/index.html

--===============3100190964582925665==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Add test description for amd_abm</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88002/">https://patchwork.freedesktop.org/series/88002/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9859_full -&gt; IGTPW_5605_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5605_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb8/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl6/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@gem_exec_whisper@basic-fds-forked.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb6/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_render_copy@linear-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@gem_userptr_blits@mmap-offset-invalidate-idle@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl1/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html">SKIP</a> ([fdo#109271]) +113 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_userptr_blits@mmap-offset-invalidate-idle@uc.html">SKIP</a> ([i915#1317]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk7/igt@gem_userptr_blits@mmap-offset-invalidate-idle@wb.html">SKIP</a> ([fdo#109271]) +101 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl7/igt@gem_userptr_blits@vma-merge.html">INCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl7/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb5/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a> ([fdo#109271]) +417 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb1/igt@kms_chamelium@vga-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_color@pipe-a-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-FAIL</a> ([IGT#6])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-dp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_dp_dsc@basic-dsc-enable-dp.html">SKIP</a> ([fdo#109349])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-dp.html">SKIP</a> ([fdo#109349])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb8/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#111825]) +34 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html">SKIP</a> ([fdo#109280]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +205 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb8/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109278]) +12 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk3/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk9/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_plane_multiple@atomic-pipe-c-tiling-y.html">FAIL</a> ([i915#1779])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb1/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb3/igt@kms_psr@psr2_primary_blt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl3/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@prime_nv_api@nv_self_import.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_i915_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb4/igt@prime_nv_test@nv_i915_sharing.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb2/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb1/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb2/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb5/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-snb6/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10@vecs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-apl1/igt@sysfs_clients@sema-10@vecs0.html">SKIP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb3/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb5/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-tglb8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk9/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk5/igt@gem_exec_schedule@u-fairslice@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk3/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-glk2/igt@i915_selftest@live@client.html">DMESG-FAIL</a> ([i915#3047]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-glk6/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-kbl4/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5605/shard-kbl3/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9859/shard-tglb8/igt@kms_async_flips@test-time-stamp.">FAIL</a> ([i915#2597]) -&gt; [PASS][143]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3100190964582925665==--

--===============1724660420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1724660420==--
