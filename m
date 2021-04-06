Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 06 Apr 2021 04:38:54 -0000
Message-ID: <161768393422.18459.8664444952250239958@emeril.freedesktop.org>
References: <20210406021925.28234-1-nidhi1.gupta@intel.com>
In-Reply-To: <20210406021925.28234-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Favailable=5Fmodes=5Fcrc_=3A_Added_test_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1022027311=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1022027311==
Content-Type: multipart/alternative;
 boundary="===============1917425183430739227=="

--===============1917425183430739227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_available_modes_crc : Added test description
URL   : https://patchwork.freedesktop.org/series/88727/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9928_full -> IGTPW_5693_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5693_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5693_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5693_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb3/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb4/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_5693_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][3] ([i915#3002])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-snb7/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-snb6/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#2896])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-tglb2/igt@gem_ctx_persistence@smoketest.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb8/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-iclb:         [PASS][7] -> [TIMEOUT][8] ([i915#3070])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb3/igt@gem_eio@in-flight-contexts-1us.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2846])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-tglb6/igt@gem_exec_fair@basic-pace@vcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2389])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb4/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk8/igt@gem_exec_whisper@basic-fds-priority-all.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk7/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#307])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_mmap_gtt@coherency:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109292])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#307])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl8/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-snb2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@uc:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1699]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl6/igt@gem_userptr_blits@process-exit-mmap-busy@uc.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#1699]) +7 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl1/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-apl:          NOTRUN -> [FAIL][29] ([i915#3324])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl2/igt@gem_userptr_blits@set-cache-level.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#3297])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#2822])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-tglb6/igt@gem_vm_create@destroy-race.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb1/igt@gem_vm_create@destroy-race.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109289])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          NOTRUN -> [FAIL][34] ([i915#3296])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl7/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109293] / [fdo#109506])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111614]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2705])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-c-legacy-gamma:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#71])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-apl:          NOTRUN -> [FAIL][43] ([i915#71])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_color@pipe-c-legacy-gamma.html
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#71])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk9/igt@kms_color@pipe-c-legacy-gamma.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk9/igt@kms_color@pipe-c-legacy-gamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +26 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk7/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][50] ([i915#1319])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109279] / [i915#3359])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109279])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][53] ([i915#180])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x128-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#52] / [i915#54]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][59] -> [FAIL][60] ([i915#79])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][61] -> [DMESG-WARN][62] ([i915#180])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][63] ([i915#2641])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][64] ([fdo#109271]) +374 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#49])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111825]) +7 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +12 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271]) +11 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#433])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#533]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#658]) +6 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#109441])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109441]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109502]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb5/igt@kms_vrr@flip-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109502])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb7/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#2437]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl7/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2437])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl1/igt@kms_writeback@writeback-check-output.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271]) +243 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl6/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +55 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl2/igt@prime_nv_pcopy@test2.html

  * igt@prime_udl:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109291])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@prime_udl.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2994])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb5/igt@sysfs_clients@busy.html
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2994])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk8/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2994]) +6 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl2/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@recycle-many:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2994]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl7/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-25:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#2994]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb5/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [FAIL][90] ([i915#2410]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][92] ([i915#2842]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-glk:          [FAIL][94] ([i915#2842]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk8/igt@gem_exec_fair@basic-none@vcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][98] ([i915#2389]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][100] ([i915#180]) -> [PASS][101] +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][102] ([i915#2428]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_userptr_blits@huge-split:
    - shard-glk:          [FAIL][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk7/igt@gem_userptr_blits@huge-split.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk3/igt@gem_userptr_blits@huge-split.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [FAIL][106] ([i915#52] / [i915#54]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109] +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][110] ([i915#155]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@stress-open-close:
    - shard-iclb:         [INCOMPLETE][112] ([i915#2369]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb5/igt@perf@stress-open-close.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb6/igt@perf@stress-open-close.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][114] ([i915#2684]) -> [WARN][115] ([i915#1804] / [i915#2684])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][116] ([i915#1804] / [i915#2684]) -> [FAIL][117] ([i915#2680])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-iclb:         [SKIP][118] ([i915#2920]) -> [SKIP][119] ([i915#658])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][120] ([i915#658]) -> [SKIP][121] ([i915#2920]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#602]) -> ([FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1436] / [i915#1814] / [i915#3002])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl1/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl4/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][130], [FAIL][131], [FAIL][132]) ([i915#2722] / [i915#3002]) -> ([FAIL][133], [FAIL][134]) ([i915#3002])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb5/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb8/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140]) ([i915#180] / [i915#1814] / [i915#3002]) -> [FAIL][141] ([i915#180])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl8/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl2/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1699]: https://gitlab.freedesktop.org/drm/intel/issues/1699
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/241

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/index.html

--===============1917425183430739227==
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
<tr><td><b>Series:</b></td><td>tests/kms_available_modes_crc : Added test d=
escription</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/88727/">https://patchwork.freedesktop.org/series/88727/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5693/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9928_full -&gt; IGTPW_5693_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5693_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5693_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5693=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb3/igt@i915_module_load@reload.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb4/i=
gt@i915_module_load@reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5693_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-snb7/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-snb6/igt@gem_ctx_persistence@clone.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
099">i915#1099</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-tglb2/igt@gem_ctx_persistence@smoketest.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-t=
glb8/igt@gem_ctx_persistence@smoketest.html">FAIL</a> ([i915#2896])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb3/igt@gem_eio@in-flight-contexts-1us.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-=
iclb7/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> ([i915#3070])</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl=
4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-tglb6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-t=
glb7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-g=
lk1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/sha=
rd-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb4/igt@gem_exec_reloc@basic-many-active@v=
cs1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk8/igt@gem_exec_whisper@basic-fds-priority-all.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_569=
3/shard-glk7/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#11=
8</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk7/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk7/ig=
t@gem_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@gem_mmap_gtt@coherency.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo#=
109292</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-ic=
lb5/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl8/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-snb2/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@uc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-kbl6/igt@gem_userptr_blits@process-exit-mmap=
-busy@uc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1699">i915#1699</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl1/igt@gem_userptr_blits@process-exit-mmap=
@wb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1699">i915#1699</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl2/igt@gem_userptr_blits@set-cache-level.h=
tml">FAIL</a> ([i915#3324])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-aft=
er-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-tglb6/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-tglb=
1/igt@gem_vm_create@destroy-race.html">FAIL</a> ([i915#2822])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@gen7_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl7/igt@gen9_exec_parse@bb-large.html">FAIL=
</a> ([i915#3296])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb4/igt@kms_big_fb@x-tiled-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb6/igt@kms_chamelium@hdmi-hpd-enable-disa=
ble-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9928/shard-kbl1/igt@kms_color@pipe-c-legacy-gamma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl=
4/igt@kms_color@pipe-c-legacy-gamma.html">FAIL</a> ([i915#71])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_color@pipe-c-legacy-gamma.html">=
FAIL</a> ([i915#71])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9928/shard-glk9/igt@kms_color@pipe-c-legacy-gamma.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk=
9/igt@kms_color@pipe-c-legacy-gamma.html">FAIL</a> ([i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-glk7/igt@kms_color_chamelium@pipe-b-ctm-0-5.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl8/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a> / [i915#3359])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-iclb7/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x128-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-128x1=
28-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-32x10=
-sliding.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5693/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">=
FAIL</a> ([i915#52] / [i915#54]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
4">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b=
-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5693/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-a=
pl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a>) +374 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-in=
dfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-spr-indfb-draw-render.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html"=
>SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl2/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-icl=
b3/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb1/igt@kms_psr@psr2_suspend.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-iclb5/igt@kms_vrr@flip-suspend.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#109=
502</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-tglb7/igt@kms_vrr@flip-suspend.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#109=
502</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-apl7/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / [i915#2437]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-kbl1/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl6/igt@prime_nv_api@i915_nv_reimport_twice=
_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>) +243 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-kbl2/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a>) +55 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@prime_udl.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#109291</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-tglb5/igt@sysfs_clients@busy.html">SKIP</a> (=
[i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5693/shard-glk8/igt@sysfs_clients@busy.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / [i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-apl2/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#2994]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-kbl7/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5693/shard-iclb5/igt@sysfs_clients@sema-25.html">SKIP</=
a> ([i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241">i915#24=
10</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_569=
3/shard-tglb5/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9928/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i=
915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5693/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar=
 issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9928/shard-glk8/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i=
915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5693/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar=
 issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5693/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5693/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-kbl1/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/sh=
ard-kbl6/igt@gem_exec_suspend@basic-s3.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a=
> ([i915#2428]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5693/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk7/igt@gem_userptr_blits@huge-split.html">FAIL</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-glk=
3/igt@gem_userptr_blits@huge-split.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.=
html">FAIL</a> ([i915#52] / [i915#54]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5693/shard-glk8/igt@kms_draw_crc@draw-method-rg=
b565-mmap-wc-ytiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/s=
hard-apl6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5693/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb5/igt@perf@stress-open-close.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/sh=
ard-iclb6/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5693/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a=
> / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804=
</a> / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5693/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a>=
 ([i915#2680])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
-5.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5693/shard-iclb7/igt@kms_psr2_sf@overlay-primary-updat=
e-sf-dmg-area-5.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4=
.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5693/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-4.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9928/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_99=
28/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2505] / [=
i915#3002] / [i915#602]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5693/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-kbl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5693/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [=
i915#3002])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-iclb8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9928/shard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#2722] / [i9=
15#3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5693/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5693/shard-iclb2/igt@runner@aborted.html=
">FAIL</a>) ([i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9928/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9928/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_99=
28/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_9928/shard-apl1/igt@runner@aborted.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
14">i915#1814</a> / [i915#3002]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5693/shard-apl6/igt@runner@aborted.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============1917425183430739227==--

--===============1022027311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1022027311==--
