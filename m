Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Jan 2021 13:53:57 -0000
Message-ID: <160985483762.13805.1712893707326296505@emeril.freedesktop.org>
References: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?avoid_recalculating_refecence_crcs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0208451288=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0208451288==
Content-Type: multipart/alternative;
 boundary="===============5006426676445866661=="

--===============5006426676445866661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: avoid recalculating refecence crcs
URL   : https://patchwork.freedesktop.org/series/85490/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9545_full -> IGTPW_5352_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5352_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5352_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5352_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-snb:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-snb7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_sequence@get-forked:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb2/igt@kms_sequence@get-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb8/igt@kms_sequence@get-forked.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs}:
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9545_full and IGTPW_5352_full:

### New IGT tests (2) ###

  * igt@gem_spin_batch@legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@legacy-resubmit:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5352_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@delta-check:
    - shard-hsw:          NOTRUN -> [SKIP][7] ([fdo#109271]) +174 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-hsw4/igt@api_intel_bb@delta-check.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-hsw:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-hsw7/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] ([i915#1037] / [i915#2870])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-hsw7/igt@gem_eio@in-flight-contexts-10ms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-hsw5/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk4/igt@gem_exec_whisper@basic-fds-priority.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk1/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#109289])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb6/igt@gen7_exec_parse@bitmasks.html
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109289])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb7/igt@gen7_exec_parse@bitmasks.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [PASS][15] -> [SKIP][16] ([fdo#109271]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk5/igt@i915_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk3/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-apl:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl8/igt@i915_pm_rpm@basic-pci-d3-state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl4/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#579]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-hsw:          NOTRUN -> [SKIP][21] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-hsw7/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb7/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [fdo#111827])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [fdo#111827])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl3/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-b-ctm-negative:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-negative.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271]) +8 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109279]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271]) +7 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk2/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109274] / [fdo#109278])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111825]) +4 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109274])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][36] ([i915#2122])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#2642])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2642])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#2642])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271]) +20 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-snb:          [PASS][41] -> [SKIP][42] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109280]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#2472])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk3/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.html

  * igt@kms_plane@plane-position-hole-pipe-b-planes:
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#2472])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-b-planes.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl2/igt@kms_plane@plane-position-hole-pipe-b-planes.html
    - shard-apl:          [PASS][48] -> [FAIL][49] ([i915#2472])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl1/igt@kms_plane@plane-position-hole-pipe-b-planes.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl3/igt@kms_plane@plane-position-hole-pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][50] ([fdo#108145] / [i915#265])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb7/igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-c-viewport-size-256:
    - shard-glk:          [PASS][52] -> [FAIL][53] ([i915#2657])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_plane_cursor@pipe-c-viewport-size-256.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111615])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][55] -> [SKIP][56] ([fdo#109441]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][57] -> [DMESG-WARN][58] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb3/igt@kms_psr@psr2_suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@cursor-rotation-180:
    - shard-hsw:          NOTRUN -> [FAIL][59] ([i915#65])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-hsw4/igt@kms_rotation_crc@cursor-rotation-180.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-hsw:          [PASS][60] -> [FAIL][61] ([i915#65])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-hsw5/igt@kms_rotation_crc@sprite-rotation-180.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-hsw6/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:
    - shard-kbl:          [PASS][62] -> [SKIP][63] ([fdo#109271]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][64] -> [SKIP][65] ([fdo#109278])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109502])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb3/igt@kms_vrr@flip-dpms.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109291])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb2/igt@prime_nv_api@i915_nv_import_vs_close.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109291])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb2/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][69] ([i915#1436] / [i915#2505] / [i915#2722])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-hsw5/igt@runner@aborted.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][70] ([i915#2846]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl6/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-pace@vecs0}:
    - shard-glk:          [FAIL][72] ([i915#2842]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-apl:          [DMESG-WARN][74] ([i915#1610]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-iclb:         [DMESG-WARN][76] ([i915#2803]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb7/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vcs1}:
    - shard-tglb:         [DMESG-WARN][78] ([i915#2803]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb5/igt@gem_exec_schedule@u-fairslice@vcs1.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][80] ([i915#118] / [i915#95]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][82] ([i915#49]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-kbl:          [FAIL][84] ([i915#49]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][86] ([i915#49]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-kbl:          [DMESG-WARN][88] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl2/igt@kms_plane_lowres@pipe-b-tiling-x.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl3/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][90] ([fdo#109642] / [fdo#111068]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][94] ([i915#2684]) -> [WARN][95] ([i915#1804] / [i915#2684])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][96] ([i915#1226]) -> [SKIP][97] ([fdo#109349])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][98] ([i915#2295] / [i915#483]) -> ([FAIL][99], [FAIL][100], [FAIL][101]) ([i915#1814] / [i915#2295] / [i915#483])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-kbl1/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl7/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl7/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][102], [FAIL][103]) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483]) -> [FAIL][104] ([i915#2295] / [i915#2724])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb1/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][105], [FAIL][106]) ([i915#1610] / [i915#2295] / [i915#2426]) -> [FAIL][107] ([i915#2295])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl7/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-apl8/igt@runner@aborted.html
    - shard-glk:          [FAIL][108] ([i915#2295] / [k.org#202321]) -> [FAIL][109] ([i915#2295] / [i915#483] / [k.org#202321])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-glk8/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][110], [FAIL][111]) ([i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -> ([FAIL][112], [FAIL][113]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2667])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb7/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb5/igt@runner@aborted.html

  
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
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2642]: https://gitlab.freedesktop.org/drm/intel/issues/2642
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2657]: https://gitlab.freedesktop.org/drm/intel/issues/2657
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2870]: https://gitlab.freedesktop.org/drm/intel/issues/2870
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5942 -> IGTPW_5352
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.html

--===============5006426676445866661==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_r=
otation_crc: avoid recalculating refecence crcs</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85490/">https://patchwork.freedesktop.org/series/85490/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5352/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9545_full -&gt; IGTPW_5352_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5352_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5352_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5352=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-snb6/igt@gem_workarounds@suspend-resume-fd.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shar=
d-snb7/igt@gem_workarounds@suspend-resume-fd.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb2/igt@kms_sequence@get-forked.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb8/i=
gt@kms_sequence@get-forked.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs}:<=
ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk7/igt@kms_atomic_transition@modeset-transition-nonblo=
cking@1x-outputs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_atomic_transition@modeset-tran=
sition-nonblocking@1x-outputs.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9545_full and IGTPW_5352_f=
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
<p>Here are the changes found in IGTPW_5352_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-hsw4/igt@api_intel_bb@delta-check.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) +174 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-hsw7/igt@gem_ctx_persistence@legacy-engines-=
cleanup.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-hsw7/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-=
hsw5/igt@gem_eio@in-flight-contexts-10ms.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2870">i915#2870</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk4/igt@gem_exec_whisper@basic-fds-priority.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/sh=
ard-glk1/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-iclb6/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-tglb7/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-glk5/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-gl=
k3/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar iss=
ues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl8/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-ap=
l4/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar iss=
ues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb6/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/sh=
ard-iclb5/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-hsw7/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-iclb7/igt@kms_chamelium@hdmi-cmp-planar-form=
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
tree/drm-tip/IGTPW_5352/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-apl3/igt@kms_chamelium@hdmi-hpd-for-each-pipe=
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
/tree/drm-tip/IGTPW_5352/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/s=
hard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x5=
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
tree/drm-tip/IGTPW_5352/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x51=
2-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-glk2/igt@kms_cursor_crc@pipe-d-cursor-512x512=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-iclb1/igt@kms_cursor_legacy@2x-long-flip-vs-=
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
tree/drm-tip/IGTPW_5352/shard-tglb8/igt@kms_flip@2x-flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111825">fdo#111825</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-iclb3/igt@kms_flip@2x-flip-vs-dpms-off-vs-mod=
eset.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-tglb7/igt@kms_flip@flip-vs-blocking-wf-vblan=
k@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2642">i915#2642</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
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
/tree/drm-tip/IGTPW_5352/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-w=
c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5352/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-c-planes:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk3/igt@kms_plane@plane-position-hole-dpms-pipe-c-plane=
s.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5352/shard-glk6/igt@kms_plane@plane-position-hole-dpms-pipe-c-planes.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2472">i915#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl7/igt@kms_plane@plane-position-hole-pipe-b-planes.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5352/shard-kbl2/igt@kms_plane@plane-position-hole-pipe-b-planes.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2472">i915#=
2472</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl1/igt@kms_plane@plane-position-hole-pipe-b-planes.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5352/shard-apl3/igt@kms_plane@plane-position-hole-pipe-b-planes.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2472">i915#=
2472</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-iclb7/igt@kms_plane_alpha_blend@pipe-d-cover=
age-vs-premult-vs-constant.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-c-viewport-size-256:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk8/igt@kms_plane_cursor@pipe-c-viewport-size-256.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
352/shard-glk6/igt@kms_plane_cursor@pipe-c-viewport-size-256.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2657">i915#265=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-=
iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb3/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb1/igt@=
kms_psr@psr2_suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-hsw4/igt@kms_rotation_crc@cursor-rotation-18=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/65">i915#65</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-hsw5/igt@kms_rotation_crc@sprite-rotation-180.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/s=
hard-hsw6/igt@kms_rotation_crc@sprite-rotation-180.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/65">i915#65</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5352/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5352/shard-iclb5/igt@kms_vblank@pipe-a-ts-continuation-modeset-rpm.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278=
">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-iclb3/igt@kms_vrr@flip-dpms.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#10950=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-tglb2/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5352/shard-iclb2/igt@prime_nv_api@i915_nv_import_vs_clos=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5352/shard-hsw5/igt@runner@aborted.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#250=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i9=
15#2722</a>)</li>
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
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/sha=
rd-kbl6/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vecs0}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/s=
hard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +3 similar issu=
es</li>
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
PW_5352/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-iclb1/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803">=
i915#2803</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5352/shard-iclb7/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a><=
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
GTPW_5352/shard-tglb5/igt@gem_exec_schedule@u-fairslice@vcs1.html">PASS</a>=
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
tip/IGTPW_5352/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html=
">PASS</a> +1 similar issue</li>
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
org/tree/drm-tip/IGTPW_5352/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5352/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5352/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-=
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
IGTPW_5352/shard-kbl3/igt@kms_plane_lowres@pipe-b-tiling-x.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb5/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#1110=
68</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_535=
2/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard=
-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +1 similar issue</li>
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
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352=
/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
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
W_5352/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109349</a=
>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-kbl1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5352/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-kbl1/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-iclb6/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-iclb4/igt@runner@aborted.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i=
915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
724">i915#2724</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2426">i915#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5352/shard-apl8/igt@runner@aborted.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9545/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-glk=
7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.=
kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9545/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9545/shard-tglb7/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2667">i915#2667</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2803">i915#2803</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/shard-tglb1/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/=
shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>)</p>
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
<li>IGT: IGT_5942 -&gt; IGTPW_5352</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9545: a412bacbe58bb98252a6b55f6390857a20689fc6 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5352: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5352/index.htm=
l<br />
  IGT_5942: e14e76a87c44c684ec958b391b030bb549254f88 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5006426676445866661==--

--===============0208451288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0208451288==--
