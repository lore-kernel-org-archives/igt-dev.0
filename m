Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 18 Dec 2020 10:42:30 -0000
Message-ID: <160828815022.27180.4166180076221250329@emeril.freedesktop.org>
References: <20201218084939.1767210-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20201218084939.1767210-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fperf=3A_Request_CLOCK=5FMONOTONIC_when_opening_events?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1047957738=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1047957738==
Content-Type: multipart/alternative;
 boundary="===============0194773216062388518=="

--===============0194773216062388518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_perf: Request CLOCK_MONOTONIC when opening events
URL   : https://patchwork.freedesktop.org/series/85069/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9502_full -> IGTPW_5312_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5312_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5312_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5312_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb8/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-tglb8/igt@i915_pm_dc@dc5-psr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb1/igt@i915_pm_dc@dc5-psr.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9502_full and IGTPW_5312_full:

### New IGT tests (1) ###

  * igt@kms_atomic_transition@modeset-transition:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5312_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][5] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][6] ([i915#2389])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][7] ([i915#2658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([fdo#109289])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb1/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#109289])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb5/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([fdo#112306])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb4/igt@gen9_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][11] ([fdo#112306])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb6/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#109288])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb1/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#109288])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-glk2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-apl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-apl7/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl3/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-b-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb8/igt@kms_color_chamelium@pipe-b-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-hsw:          NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-hsw2/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
    - shard-glk:          NOTRUN -> [SKIP][21] ([fdo#109271]) +21 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109278] / [fdo#109279])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109279])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109278]) +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271]) +30 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-apl3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111825]) +12 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109274]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-hsw:          NOTRUN -> [SKIP][28] ([fdo#109271]) +23 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109280]) +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#1187])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#1187])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [PASS][32] -> [INCOMPLETE][33] ([i915#1185] / [i915#250])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#165] / [i915#180] / [i915#78])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#112054])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb2/igt@kms_psr@psr2_basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb1/igt@kms_psr@psr2_basic.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +39 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2530])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb3/igt@nouveau_crc@pipe-d-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278] / [i915#2530])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb1/igt@nouveau_crc@pipe-d-source-outp-inactive.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109291])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb5/igt@prime_nv_test@i915_blt_fill_nv_read.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109291])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb8/igt@prime_nv_test@i915_blt_fill_nv_read.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][44] ([i915#658]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb8/igt@feature_discovery@psr2.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][46] ([i915#118] / [i915#95]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [SKIP][48] ([i915#579]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb2/igt@i915_pm_rpm@modeset-lpsp.html
    - shard-iclb:         [SKIP][50] ([i915#579]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-hsw:          [INCOMPLETE][52] ([i915#2055] / [i915#2295] / [i915#300]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][58] ([i915#588]) -> [SKIP][59] ([i915#658])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][60] ([i915#2681] / [i915#2684]) -> [WARN][61] ([i915#1804] / [i915#2684])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][62] ([i915#2680]) -> [WARN][63] ([i915#2681] / [i915#2684])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][64], [FAIL][65]) ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][66], [FAIL][67], [FAIL][68]) ([i915#1436] / [i915#2295] / [i915#2426] / [i915#2505] / [i915#2722] / [i915#483])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl7/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl3/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl7/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          [FAIL][69] ([i915#2295] / [i915#2722]) -> ([FAIL][70], [FAIL][71]) ([i915#1610] / [i915#2295] / [i915#2426] / [i915#2722])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-apl2/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-apl2/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-apl4/igt@runner@aborted.html
    - shard-glk:          [FAIL][72] ([i915#2295] / [i915#2722] / [k.org#202321]) -> [FAIL][73] ([i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk1/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         [FAIL][74] ([i915#2295] / [i915#2722]) -> ([FAIL][75], [FAIL][76]) ([i915#1764] / [i915#2295] / [i915#2426] / [i915#2722])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-tglb5/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb3/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109288]: https://bugs.freedesktop.org/show_bug.cgi?id=109288
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2680]: https://gitlab.freedesktop.org/drm/intel/issues/2680
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#300]: https://gitlab.freedesktop.org/drm/intel/issues/300
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5908 -> IGTPW_5312
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9502: 062fb02ead4596719cd755fc28bcb44858a3d80b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5312: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/index.html
  IGT_5908: b8b1391f7bfff83397ddc47c0083c2c7ed06be37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/index.html

--===============0194773216062388518==
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
<tr><td><b>Series:</b></td><td>lib/igt_perf: Request CLOCK_MONOTONIC when o=
pening events</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85069/">https://patchwork.freedesktop.org/series/85069/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5312/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9502_full -&gt; IGTPW_5312_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5312_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5312_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5312=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9502/shard-iclb2/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb8/igt@i91=
5_pm_dc@dc5-psr.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9502/shard-tglb8/igt@i915_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb1/igt@i91=
5_pm_dc@dc5-psr.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9502_full and IGTPW_5312_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic_transition@modeset-transition:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5312_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@v=
ecs0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb1/igt@gen3_render_mixed_blits.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#=
109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb5/igt@gen3_render_mixed_blits.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#=
109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb4/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2306">fdo#112306</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb6/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2306">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb1/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109288">fdo=
#109288</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb5/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109288">fdo=
#109288</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-glk2/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-apl7/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-kbl3/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-iclb8/igt@kms_color_chamelium@pipe-b-gamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-hsw2/igt@kms_color_chamelium@pipe-d-ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-512x170=
-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +21 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-256x2=
56-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-apl3/igt@kms_flip@2x-flip-vs-absolute-wf_vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +30 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111825">fdo#111825</a>) +12 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-iclb5/igt@kms_flip@2x-nonexisting-fb.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-hsw5/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-p=
ipe-c-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5312/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-=
suspend-pipe-c-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/250">i915#250</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-yf.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shar=
d-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb1/igt@km=
s_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-kbl1/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb3/igt@nouveau_crc@pipe-d-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb1/igt@nouveau_crc@pipe-d-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-tglb5/igt@prime_nv_test@i915_blt_fill_nv_read=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5312/shard-iclb8/igt@prime_nv_test@i915_blt_fill_nv_read=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-iclb=
2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5312/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">PA=
SS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9502/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tgl=
b2/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9502/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-icl=
b7/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055=
">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/300">i915#300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5312/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#=
180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
12/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_531=
2/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/s=
hard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#268=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5312/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2680">i915#2680=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/=
shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</=
li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9502/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5312/shard-kbl7/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-kbl6/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5312/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i91=
5#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/250=
5">i915#2505</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9502/shard-apl2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-apl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5312/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i91=
5#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/272=
2">i915#2722</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9502/shard-glk1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/sha=
rd-glk7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https=
://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9502/shard-tglb5/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/shard-tglb=
3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5312/shard-tglb2/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1764">i915#1764</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2=
295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">=
i915#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2722">i915#2722</a>)</p>
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
<li>IGT: IGT_5908 -&gt; IGTPW_5312</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9502: 062fb02ead4596719cd755fc28bcb44858a3d80b @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5312: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5312/index.htm=
l<br />
  IGT_5908: b8b1391f7bfff83397ddc47c0083c2c7ed06be37 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0194773216062388518==--

--===============1047957738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1047957738==--
