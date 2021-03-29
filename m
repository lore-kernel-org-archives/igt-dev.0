Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 29 Mar 2021 22:02:03 -0000
Message-ID: <161705532306.26035.4847107265261845131@emeril.freedesktop.org>
References: <20210329190016.13394-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210329190016.13394-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fplane=3A_Don=27t_t?=
 =?utf-8?q?est_all_format+modifier_combinations?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0790852209=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0790852209==
Content-Type: multipart/alternative;
 boundary="===============0757754718489079282=="

--===============0757754718489079282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_plane: Don't test all format+modifier combinations
URL   : https://patchwork.freedesktop.org/series/88554/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9913_full -> IGTPW_5674_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5674_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5674_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5674_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-snb2/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  
Known issues
------------

  Here are the changes found in IGTPW_5674_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][2] ([i915#180])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099]) +7 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-snb7/igt@gem_ctx_persistence@legacy-engines-queued.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#280])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb1/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2849])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#2190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#307])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-glk6/igt@gem_mmap_gtt@cpuset-big-copy.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk2/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#307]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][22] ([i915#3002])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#1699]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb6/igt@gem_userptr_blits@process-exit-mmap-busy@gtt.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#1699]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html
    - shard-kbl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#1699]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl4/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#1699]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl6/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html
    - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1699]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk7/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-snb:          NOTRUN -> [FAIL][28] ([i915#3324])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-snb5/igt@gem_userptr_blits@set-cache-level.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          NOTRUN -> [FAIL][29] ([i915#3296])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl2/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#112306])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb6/igt@gen9_exec_parse@secure-batches.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#112306])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][32] ([i915#454])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109293] / [fdo#109506])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109506] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271]) +186 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#2574])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110725] / [fdo#111614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@kms_ccs@pipe-d-missing-ccs-buffer.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb5/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk6/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][48] ([i915#1319]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][49] ([i915#180])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109279])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [fdo#109279])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111825]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#109278])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#2346])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dp_dsc@basic-dsc-enable-dp:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109349])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-dp.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#52] / [i915#54]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271]) +185 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109280]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][64] ([fdo#109271]) +377 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#533])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][66] ([fdo#108145] / [i915#265]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][67] ([fdo#108145] / [i915#265]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#658]) +7 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#658])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#658]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#658]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([fdo#109441])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][74] ([IGT#2])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#2437])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl7/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109291])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb5/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#2994]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#2994]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl4/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][80] ([i915#658]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb6/igt@feature_discovery@psr2.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_create@create-clear:
    - shard-glk:          [FAIL][82] ([i915#1888] / [i915#3160]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-glk4/igt@gem_create@create-clear.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk8/igt@gem_create@create-clear.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][84] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb1/igt@gem_eio@unwedge-stress.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [FAIL][86] ([i915#2842]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl6/igt@gem_exec_fair@basic-none@rcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl1/igt@gem_exec_fair@basic-none@rcs0.html
    - shard-glk:          [FAIL][88] ([i915#2842]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-iclb:         [INCOMPLETE][90] ([i915#1895]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-iclb:         [FAIL][92] ([i915#307]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb3/igt@gem_mmap_gtt@big-copy-xy.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb7/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][94] ([i915#1149]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-tglb7/igt@kms_color@pipe-a-gamma.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tglb6/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][96] ([i915#180]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [FAIL][98] ([i915#52] / [i915#54]) -> [PASS][99] +5 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][100] ([i915#180]) -> [PASS][101] +7 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][102] ([fdo#109441]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][104] ([i915#180] / [i915#295]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][106] ([i915#2852]) -> [FAIL][107] ([i915#2842])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb4/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][108] ([i915#2684]) -> [WARN][109] ([i915#1804] / [i915#2684])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][110] ([fdo#109349]) -> [DMESG-WARN][111] ([i915#1226])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][112] ([i915#2920]) -> [SKIP][113] ([i915#658]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][114] ([i915#658]) -> [SKIP][115] ([i915#2920]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#602]) -> ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl4/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl7/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl7/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl1/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][134], [FAIL][135]) ([i915#1814] / [i915#3002]) -> ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140]) ([i915#180] / [i915#1814] / [i915#3002])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-apl1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-apl6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl8/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1699]: https://gitlab.freedesktop.org/drm/intel/issues/1699
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1895]: https://gitlab.freedesktop.org/drm/intel/issues/1895
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.html

--===============0757754718489079282==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_p=
lane: Don&#39;t test all format+modifier combinations</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/88554/">https://patchwork.freedesktop.org/series/88554/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5674/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9913_full -&gt; IGTPW_5674_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5674_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5674_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5674=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-snb2/igt@kms_plane@pixel-format-pipe-a-plane=
s-source-clamping.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5674_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl8/igt@gem_ctx_isolation@preservation-s3@v=
cs0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
queued.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1099">i915#1099</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-tglb1/igt@gem_ctx_sseu@engines.html">SKIP</a=
> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl=
6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/s=
hard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#28=
42])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-t=
glb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kb=
l6/igt@gem_exec_fair@basic-pace@rcs0.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-g=
lk9/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/sha=
rd-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])=
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl2/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-glk6/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk=
2/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shar=
d-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307]) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl1/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-iclb6/igt@gem_userptr_blits@process-exit-mma=
p-busy@gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1699">i915#1699</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@uc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-tglb6/igt@gem_userptr_blits@process-exit-mmap=
-busy@uc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1699">i915#1699</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-kbl4/igt@gem_userptr_blits@process-exit-mmap-=
busy@uc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1699">i915#1699</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@wc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-apl6/igt@gem_userptr_blits@process-exit-mmap-=
busy@wc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1699">i915#1699</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-glk7/igt@gem_userptr_blits@process-exit-mmap-=
busy@wc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1699">i915#1699</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-snb5/igt@gem_userptr_blits@set-cache-level.h=
tml">FAIL</a> ([i915#3324])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl2/igt@gen9_exec_parse@bb-large.html">FAIL=
</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-iclb6/igt@gen9_exec_parse@secure-batches.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11230=
6">fdo#112306</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-tglb6/igt@gen9_exec_parse@secure-batches.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11230=
6">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress-pc8.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl2/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +186 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard=
-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-iclb2/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@kms_ccs@pipe-d-missing-ccs-buffer.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl8/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-iclb5/igt@kms_chamelium@vga-hpd-without-ddc.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-glk6/igt@kms_color_chamelium@pipe-b-ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl7/igt@kms_content_protection@atomic.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/s=
hard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-tglb2/igt@kms_cursor_legacy@2x-nonblocking-mo=
deset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111825">fdo#111825</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-iclb6/igt@kms_cursor_legacy@2x-nonblocking-mo=
deset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-dp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-dp.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
49">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5674/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">=
FAIL</a> ([i915#52] / [i915#54]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5674/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +185 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-snb2/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) +377 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pi=
pe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +7 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-glk5/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a> / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-iclb3/=
igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl2/igt@kms_sysfs_edid_timing.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IG=
T#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl7/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl7/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-iclb5/igt@prime_nv_api@nv_i915_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-apl6/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5674/shard-kbl4/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a> ([i915#6=
58]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/s=
hard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-glk4/igt@gem_create@create-clear.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / [=
i915#3160]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5674/shard-glk8/igt@gem_create@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a> =
/ [i915#2481] / [i915#3070]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5674/shard-iclb7/igt@gem_eio@unwedge-stress.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9913/shard-kbl6/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i=
915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5674/shard-kbl1/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +1 similar=
 issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9913/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i=
915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5674/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +1 similar=
 issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb2/igt@gem_exec_whisper@basic-queues-forked-all.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1895">i915#1895</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5674/shard-iclb3/igt@gem_exec_whisper@basic-queues-forked-all.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb3/igt@gem_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915=
#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674=
/shard-iclb7/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-tglb7/igt@kms_color@pipe-a-gamma.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-tg=
lb6/igt@kms_color@pipe-a-gamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5674/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled=
.html">FAIL</a> ([i915#52] / [i915#54]) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5674/shard-glk5/igt@kms_draw_crc@draw-method-r=
gb565-mmap-wc-untiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5674/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>=
 +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_567=
4/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a> / [i915#295]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5674/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation=
-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> ([i915#2852]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5674/shard-iclb4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</=
a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5674/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> =
/ [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_56=
74/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1=
.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5674/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4=
.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5674/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9913/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_99=
13/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/sh=
ard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-k=
bl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_9913/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2505] / [i915#30=
02] / [i915#602]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5674/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5674/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kbl3/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/s=
hard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5674/shard-kbl1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-kb=
l7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9913/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9913/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / [i915#3002]) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl1/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-a=
pl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5674/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5674/shard-apl8/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5674/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>=
 / [i915#3002])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============0757754718489079282==--

--===============0790852209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0790852209==--
