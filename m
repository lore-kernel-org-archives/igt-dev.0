Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Jan 2021 17:01:50 -0000
Message-ID: <160986611055.13805.1960337421703100788@emeril.freedesktop.org>
References: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20210105111749.463432-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_Synchronize_perf_metrics?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0883257176=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0883257176==
Content-Type: multipart/alternative;
 boundary="===============5568724358026078176=="

--===============5568724358026078176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/perf: Synchronize perf metrics
URL   : https://patchwork.freedesktop.org/series/85499/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9545_full -> IGTPW_5355_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5355_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5355_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5355_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-iclb:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@gem_workarounds@suspend-resume-context.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb8/igt@gem_workarounds@suspend-resume-context.html
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk7/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9545_full and IGTPW_5355_full:

### New IGT tests (2) ###

  * igt@gem_spin_batch@legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@legacy-resubmit:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5355_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-hsw:          NOTRUN -> [WARN][7] ([i915#2283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw7/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-hsw:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw4/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_pread@exhaustion:
    - shard-hsw:          NOTRUN -> [WARN][9] ([i915#2658])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw6/igt@gem_pread@exhaustion.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#2635])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl7/igt@gem_workarounds@suspend-resume-context.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#2635]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk5/igt@gem_workarounds@suspend-resume-context.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk8/igt@gem_workarounds@suspend-resume-context.html
    - shard-hsw:          NOTRUN -> [DMESG-WARN][14] ([i915#2637])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109289])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb8/igt@gen7_exec_parse@bitmasks.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109289])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb7/igt@gen7_exec_parse@bitmasks.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#579])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb5/igt@i915_pm_rpm@system-suspend-modeset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb3/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl7/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-kbl:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#579])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb1/igt@i915_pm_rpm@system-suspend-modeset.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb1/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-hsw:          NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw7/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb6/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [fdo#111827])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [fdo#111827])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][31] ([fdo#109271]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109279]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271]) +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk7/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109274] / [fdo#109278])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111825]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109274])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][38] -> [DMESG-WARN][39] ([i915#2637]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][40] ([i915#2122])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#2642])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#2642])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#2642])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +19 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109280]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([i915#433])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][48] ([fdo#108145] / [i915#265])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          NOTRUN -> [SKIP][50] ([fdo#109271]) +177 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109441]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-idle:
    - shard-snb:          [PASS][54] -> [SKIP][55] ([fdo#109271]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-idle.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-idle.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109502])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb7/igt@kms_vrr@flip-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109502])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb2/igt@kms_vrr@flip-dpms.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109291])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb6/igt@prime_nv_api@i915_nv_import_vs_close.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109291])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb6/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> ([FAIL][60], [FAIL][61]) ([fdo#109271] / [i915#2295] / [i915#2505])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw6/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw4/igt@runner@aborted.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][62] ([i915#2846]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-pace@rcs0}:
    - shard-kbl:          [FAIL][64] ([i915#2842]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][66] ([i915#2389]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-apl:          [DMESG-WARN][68] ([i915#1610]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl6/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-iclb:         [DMESG-WARN][70] ([i915#2803]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb4/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vcs1}:
    - shard-tglb:         [DMESG-WARN][72] ([i915#2803]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs1.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][74] ([i915#118] / [i915#95]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][76] ([i915#454]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][78] ([i915#49]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-kbl:          [FAIL][80] ([i915#49]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][82] ([i915#49]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-kbl:          [DMESG-WARN][84] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-kbl3/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb3/igt@kms_psr@psr2_basic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb2/igt@kms_psr@psr2_basic.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][88] ([i915#2684]) -> [WARN][89] ([i915#1804] / [i915#2684])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][90] ([i915#1226]) -> [SKIP][91] ([fdo#109349])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][92], [FAIL][93]) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483]) -> ([FAIL][94], [FAIL][95]) ([i915#2295] / [i915#2724] / [i915#483])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb4/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][96], [FAIL][97]) ([i915#1610] / [i915#2295] / [i915#2426]) -> ([FAIL][98], [FAIL][99]) ([fdo#109271] / [i915#2295])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl7/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl4/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl6/igt@runner@aborted.html
    - shard-glk:          [FAIL][100] ([i915#2295] / [k.org#202321]) -> ([FAIL][101], [FAIL][102], [FAIL][103]) ([i915#2295] / [i915#483] / [k.org#202321])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk3/igt@runner@aborted.html

  
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
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2642]: https://gitlab.freedesktop.org/drm/intel/issues/2642
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5942 -> IGTPW_5355
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5355: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/index.html
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/index.html

--===============5568724358026078176==
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
<tr><td><b>Series:</b></td><td>lib/i915/perf: Synchronize perf metrics</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85499/">https://patchwork.freedesktop.org/series/85499/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5355/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9545_full -&gt; IGTPW_5355_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5355_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5355_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5355=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-iclb6/igt@gem_workarounds@suspend-resume-context.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355=
/shard-iclb8/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a=
></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/=
shard-kbl2/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a><=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk9/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5355/shard-glk7/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a1-hdmi-a2.html=
">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9545_full and IGTPW_5355_f=
ull:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_spin_batch@legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5355_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-hsw7/igt@core_hotunplug@unbind-rebind.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2283">=
i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-hsw4/igt@gem_ctx_persistence@engines-cleanup=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-hsw6/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl7/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/=
shard-apl4/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635=
</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-glk5/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/=
shard-glk8/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635=
</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-hsw6/igt@gem_workarounds@suspend-resume-conte=
xt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2637">i915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-iclb8/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-tglb7/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-iclb5/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/sha=
rd-iclb3/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shar=
d-apl7/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl6/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shar=
d-kbl4/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-tglb1/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/sha=
rd-tglb1/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-hsw7/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-iclb6/igt@kms_chamelium@hdmi-cmp-planar-form=
ats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-kbl6/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-glk1/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-apl6/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-negative:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x51=
2-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-glk7/igt@kms_cursor_crc@pipe-d-cursor-512x512=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-iclb8/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-tglb2/igt@kms_flip@2x-flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111825">fdo#111825</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5355/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637=
">i915#2637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-tglb1/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-apl2/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-tg=
lb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-cover=
age-vs-premult-vs-constant.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-yf.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +177 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5355/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-=
iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-idle:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-idle.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355=
/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-idle.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-iclb7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#109502=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-tglb2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#109502=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-tglb6/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5355/shard-iclb6/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5355/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-hsw4/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2505">i915#2505</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/sha=
rd-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/sh=
ard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5355/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i=
915#1610</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5355/shard-apl6/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803">=
i915#2803</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5355/shard-iclb4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a><=
/p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs1}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803"=
>i915#2803</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5355/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs1.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5355/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html=
">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb1/ig=
t@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5355/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5355/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5355/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i91=
5#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
78">i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5355/shard-kbl3/igt@kms_plane_lowres@pipe-b-tiling-x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb3/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb=
2/igt@kms_psr@psr2_basic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355=
/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i9=
15#1226</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5355/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-iclb4/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/sh=
ard-iclb8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2426">i915#2426</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5355/shard-apl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-apl=
6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-gl=
k7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5355/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/shard-glk3/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kerne=
l.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5942 -&gt; IGTPW_5355</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5355: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5355/index.htm=
l<br />
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5568724358026078176==--

--===============0883257176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0883257176==--
