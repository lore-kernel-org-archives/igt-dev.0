Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 11 Dec 2020 07:31:47 -0000
Message-ID: <160767190716.16103.16121377260444929703@emeril.freedesktop.org>
References: <20201211060706.14347-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201211060706.14347-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3Areduce_execution_time_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1697504882=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1697504882==
Content-Type: multipart/alternative;
 boundary="===============8742765749025038694=="

--===============8742765749025038694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition:reduce execution time (rev4)
URL   : https://patchwork.freedesktop.org/series/84516/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9474_full -> IGTPW_5271_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5271_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5271_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5271_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pipe-a:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pipe-a.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pipe-a.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-a:
    - shard-iclb:         [PASS][3] -> [FAIL][4] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb1/igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-a.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb4/igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-a.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-iclb:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_5271_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([fdo#112283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-snb:          [PASS][10] -> [FAIL][11] ([i915#2389])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#110542])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([fdo#112306])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html
    - shard-iclb:         NOTRUN -> [SKIP][14] ([fdo#112306])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][15] -> [WARN][16] ([i915#2681])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         [PASS][17] -> [WARN][18] ([i915#2684])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#579]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb2/igt@i915_pm_rpm@dpms-lpsp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#579]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb7/igt@i915_pm_rpm@gem-evict-pwrite.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-hsw4/igt@i915_pm_rpm@gem-pread.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw1/igt@i915_pm_rpm@gem-pread.html
    - shard-kbl:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-kbl6/igt@i915_pm_rpm@gem-pread.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl2/igt@i915_pm_rpm@gem-pread.html
    - shard-apl:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-apl4/igt@i915_pm_rpm@gem-pread.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl1/igt@i915_pm_rpm@gem-pread.html
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk4/igt@i915_pm_rpm@gem-pread.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk6/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_atomic_transition@3x-modeset-transitions-nonblocking:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#112041])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb7/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html

  * igt@kms_atomic_transition@5x-modeset-transitions:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#112025])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb6/igt@kms_atomic_transition@5x-modeset-transitions.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@edp-1-pipe-d:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#319]) +23 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@edp-1-pipe-d.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@edp-1-pipe-d.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-b:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([fdo#109052]) +15 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb1/igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-b.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb4/igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-b.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#2705])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl2/igt@kms_chamelium@dp-hpd-fast.html
    - shard-hsw:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw8/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109279]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [fdo#109279])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#54]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
    - shard-apl:          [PASS][49] -> [FAIL][50] ([i915#54]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109274] / [fdo#109278])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271]) +18 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][55] -> [DMESG-WARN][56] ([i915#2635])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][57] -> [DMESG-WARN][58] ([i915#2637]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111825]) +9 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271]) +19 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109280]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [PASS][62] -> [DMESG-WARN][63] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][64] ([fdo#108145] / [i915#265])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][65] ([fdo#108145] / [i915#265])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][66] ([fdo#108145] / [i915#265])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109441]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109441])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_sysfs_edid_timing:
    - shard-hsw:          [PASS][70] -> [FAIL][71] ([IGT#2])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-hsw1/igt@kms_sysfs_edid_timing.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-query-busy-hang:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271]) +14 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk1/igt@kms_vblank@pipe-d-query-busy-hang.html
    - shard-hsw:          NOTRUN -> [SKIP][73] ([fdo#109271]) +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw7/igt@kms_vblank@pipe-d-query-busy-hang.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#2530])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109289])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb8/igt@perf@per-context-mode-unprivileged.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109289])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109295])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@prime_vgem@fence-read-hang.html
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109295])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb5/igt@prime_vgem@fence-read-hang.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][79] ([i915#2389]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [DMESG-WARN][81] ([i915#1602]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb2/igt@gem_softpin@noreloc-s3.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb8/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [DMESG-WARN][83] ([i915#1602] / [i915#2635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl7/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [DMESG-WARN][85] ([i915#1602] / [i915#2635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk2/igt@gem_softpin@noreloc-s3.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk7/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [DMESG-WARN][87] ([i915#2637]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-hsw6/igt@gem_softpin@noreloc-s3.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw4/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [DMESG-WARN][89] ([i915#1602]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-iclb:         [SKIP][91] ([i915#579]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb5/igt@i915_pm_rpm@sysfs-read.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb7/igt@i915_pm_rpm@sysfs-read.html
    - shard-apl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-apl3/igt@i915_pm_rpm@sysfs-read.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl3/igt@i915_pm_rpm@sysfs-read.html
    - shard-glk:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk5/igt@i915_pm_rpm@sysfs-read.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk5/igt@i915_pm_rpm@sysfs-read.html
    - shard-tglb:         [SKIP][97] ([i915#579]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb2/igt@i915_pm_rpm@sysfs-read.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb7/igt@i915_pm_rpm@sysfs-read.html
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-hsw8/igt@i915_pm_rpm@sysfs-read.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw8/igt@i915_pm_rpm@sysfs-read.html
    - shard-kbl:          [SKIP][101] ([fdo#109271]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-kbl2/igt@i915_pm_rpm@sysfs-read.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl7/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][103] ([i915#2597]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb5/igt@kms_async_flips@test-time-stamp.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-apl:          [FAIL][105] ([i915#54]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-glk:          [FAIL][107] ([i915#54]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
    - shard-kbl:          [FAIL][109] ([i915#54]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [FAIL][111] ([i915#2346]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][113] ([i915#407]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a1-hdmi-a2.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk9/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][115] ([i915#2598]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [FAIL][117] ([i915#79]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl8/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [DMESG-WARN][119] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][121] ([fdo#109441]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb8/igt@kms_psr@psr2_sprite_plane_onoff.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][123] ([i915#2648]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][125] ([i915#1542]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk4/igt@perf@polling-parameterized.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk3/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][127], [FAIL][128]) ([i915#2295] / [i915#2722] / [i915#2724]) -> ([FAIL][129], [FAIL][130]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb2/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb5/igt@runner@aborted.html
    - shard-glk:          ([FAIL][131], [FAIL][132]) ([i915#2295] / [i915#2722] / [i915#86] / [k.org#202321]) -> ([FAIL][133], [FAIL][134]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk5/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1602] / [i915#2295] / [i915#2722] / [i915#456]) -> ([FAIL][138], [FAIL][139]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#456])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb5/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@runner@aborted.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109052]: https://bugs.freedesktop.org/show_bug.cgi?id=109052
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112041]: https://bugs.freedesktop.org/show_bug.cgi?id=112041
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#319]: https://gitlab.freedesktop.org/drm/intel/issues/319
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [k.org

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/index.html

--===============8742765749025038694==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition:reduce execution=
 time (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84516/">https://patchwork.freedesktop.org/series/84516/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5271/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9474_full -&gt; IGTPW_5271_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5271_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5271_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5271=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb7/igt@kms_atomic_transition@plane-all-modeset-transi=
tion-fencing-internal-panels@edp-1-pipe-a.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb6/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels@edp-1-pi=
pe-a.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-a:=
</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-iclb1/igt@kms_atomic_transition@plane-all-transition-non=
blocking@edp-1-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5271/shard-iclb4/igt@kms_atomic_transition@plane-=
all-transition-nonblocking@edp-1-pipe-a.html">FAIL</a> +8 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5271/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html=
">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
71/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN=
</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5271_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@gem_exec_params@secure-non-master.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
12283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/=
shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb7/igt@gem_userptr_blits@coherency-unsync=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110542">fdo#110542</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112306"=
>fdo#112306</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-iclb3/igt@gen9_exec_parse@bb-start-out.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112306"=
>fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-=
tglb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-=
iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-iclb2/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt=
@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/579">i915#579</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb7/igt@i915_pm_rpm@gem-evict-pwrite.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tg=
lb5/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-hsw4/igt@i915_pm_rpm@gem-pread.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw1/igt@i9=
15_pm_rpm@gem-pread.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-kbl6/igt@i915_pm_rpm@gem-pread.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-kbl2/igt@i9=
15_pm_rpm@gem-pread.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-apl4/igt@i915_pm_rpm@gem-pread.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-apl1/igt@i9=
15_pm_rpm@gem-pread.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-glk4/igt@i915_pm_rpm@gem-pread.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk6/igt@i9=
15_pm_rpm@gem-pread.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@3x-modeset-transitions-nonblocking:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb7/igt@kms_atomic_transition@3x-modeset-t=
ransitions-nonblocking.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D112041">fdo#112041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@5x-modeset-transitions:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb6/igt@kms_atomic_transition@5x-modeset-t=
ransitions.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D112025">fdo#112025</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@e=
dp-1-pipe-d:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transi=
tion-internal-panels@edp-1-pipe-d.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@kms_atomic_trans=
ition@plane-all-modeset-transition-internal-panels@edp-1-pipe-d.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/319">i915#3=
19</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@edp-1-pipe-b:=
</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-iclb1/igt@kms_atomic_transition@plane-all-transition-non=
blocking@edp-1-pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5271/shard-iclb4/igt@kms_atomic_transition@plane-=
all-transition-nonblocking@edp-1-pipe-b.html">FAIL</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109052">fdo#109052</a>) +15 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb6/igt@kms_big_joiner@invalid-modeset.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/270=
5">i915#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-kbl2/igt@kms_chamelium@dp-hpd-fast.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-hsw8/igt@kms_chamelium@dp-hpd-fast.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-apl3/igt@kms_color_chamelium@pipe-a-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-green-to-red:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-512x17=
0-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x17=
0-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5271/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5271/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-apl3/igt@kms_flip@2x-flip-vs-absolute-wf_vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +18 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-iclb7/igt@kms_flip@2x-flip-vs-absolute-wf_vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5271/shard-glk4/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2635">i915#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5271/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637=
">i915#2637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-kbl4/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
71/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915=
#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602=
">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb=
5/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@kms_psr@psr2_sprite_render.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">=
fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-hsw1/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-hsw6/igt@k=
ms_sysfs_edid_timing.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/igt-gpu-tools/issues/2">IGT#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-busy-hang:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-glk1/igt@kms_vblank@pipe-d-query-busy-hang.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +14 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-hsw7/igt@kms_vblank@pipe-d-query-busy-hang.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5271/shard-tglb5/igt@nouveau_crc@pipe-c-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-iclb8/igt@perf@per-context-mode-unprivileged.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-tglb5/igt@perf@per-context-mode-unprivileged.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-tglb3/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5271/shard-iclb5/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5271/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-iclb2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/sha=
rd-iclb8/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-apl1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_527=
1/shard-apl7/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-glk2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_527=
1/shard-glk7/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-hsw6/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shar=
d-hsw4/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-kbl4/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shar=
d-kbl3/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-iclb5/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb=
7/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-apl3/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-=
apl3/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-glk5/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-=
glk5/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-tglb2/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb=
7/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-hsw8/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-=
hsw8/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-kbl2/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-=
kbl7/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271=
/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54=
">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5271/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html"=
>PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54=
">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5271/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html"=
>PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9474/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54=
">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5271/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html"=
>PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">=
i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5271/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-glk3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptibl=
e@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/407">i915#407</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk9/igt@kms_flip@2x-modeset-vs-vbl=
ank-race-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i=
915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5271/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_527=
1/shard-apl8/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@kms_pipe_crc_basic@susp=
end-read-crc-pipe-a.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-iclb8/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
71/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2648">i915#2648</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5271/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-rp=
m.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-glk4/igt@perf@polling-parameterized.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard=
-glk3/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-iclb4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2724">i915#2724</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5271/shard-iclb3/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-=
iclb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-glk5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-glk2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/86">i915#86</a> / [k.org#202321]) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/shard-glk2/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
271/shard-glk4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / [k.org#20232=
1])</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9474/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9474/shard-tglb1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9474/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5271/s=
hard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5271/shard-tglb3/igt@runner@aborted.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i91=
5#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/229=
5">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/456">i915#456</a>)</p>
</li>
</ul>
</li>
</ul>
<p>[k.org</p>

</body>
</html>

--===============8742765749025038694==--

--===============1697504882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1697504882==--
