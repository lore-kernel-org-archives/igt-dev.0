Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 18 Dec 2020 08:02:15 -0000
Message-ID: <160827853559.27179.4035748423553215801@emeril.freedesktop.org>
References: <20201218060635.8416-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201218060635.8416-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Ftransition=3Areduce_execution_time_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0992057250=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0992057250==
Content-Type: multipart/alternative;
 boundary="===============8500536881980105469=="

--===============8500536881980105469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_transition:reduce execution time (rev5)
URL   : https://patchwork.freedesktop.org/series/84516/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9502_full -> IGTPW_5310_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9502_full and IGTPW_5310_full:

### New IGT tests (1) ###

  * igt@kms_atomic_transition@modeset-transition:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5310_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@kms:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#62])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl6/igt@gem_eio@kms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@gem_eio@kms.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][3] ([i915#2389]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][4] ([i915#2658])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-hsw:          [PASS][5] -> [DMESG-WARN][6] ([i915#2637])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-hsw4/igt@gem_workarounds@suspend-resume-fd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([fdo#109289])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][8] ([fdo#109289])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#112306])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@gen9_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#112306])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb5/igt@gen9_exec_parse@batch-without-end.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([fdo#109288])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb7/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#109288])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@i915_pm_sseu@full-enable.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][13] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk9/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-apl6/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][15] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-b-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_color_chamelium@pipe-b-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-hsw:          NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_concurrent@pipe-b:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180] / [i915#78])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl4/igt@kms_concurrent@pipe-b.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
    - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271]) +21 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109278] / [fdo#109279])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109279])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109278]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][32] -> [FAIL][33] ([i915#96])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271]) +30 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-apl8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111825]) +11 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109274]) +4 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-hsw:          NOTRUN -> [SKIP][39] ([fdo#109271]) +23 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#49])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109280]) +7 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#1187])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb1/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#1187])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#165] / [i915#180] / [i915#78])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#112054])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109441]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb2/igt@kms_psr@psr2_basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_psr@psr2_basic.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271]) +43 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@nouveau_crc@pipe-d-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#2530])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@nouveau_crc@pipe-d-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#2530])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@nouveau_crc@pipe-d-source-outp-inactive.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109291])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@prime_nv_test@i915_blt_fill_nv_read.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109291])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][55] ([fdo#109271] / [i915#2295])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][56] ([i915#658]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb8/igt@feature_discovery@psr2.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][58] ([i915#118] / [i915#95]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [SKIP][60] ([i915#579]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp.html
    - shard-iclb:         [SKIP][62] ([i915#579]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-hsw:          [INCOMPLETE][64] ([i915#2055] / [i915#2295] / [i915#300]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][68] ([fdo#109441]) -> [PASS][69] +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][70] ([i915#2681] / [i915#2684]) -> [WARN][71] ([i915#1804] / [i915#2684])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@runner@aborted:
    - shard-tglb:         [FAIL][72] ([i915#2295] / [i915#2722]) -> ([FAIL][73], [FAIL][74]) ([i915#2295] / [i915#2426] / [i915#2722])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-tglb5/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb8/igt@runner@aborted.html

  
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
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#300]: https://gitlab.freedesktop.org/drm/intel/issues/300
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5908 -> IGTPW_5310
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9502: 062fb02ead4596719cd755fc28bcb44858a3d80b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html
  IGT_5908: b8b1391f7bfff83397ddc47c0083c2c7ed06be37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html

--===============8500536881980105469==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic_transition:reduce execution time (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84516/">https://patchwork.freedesktop.org/series/84516/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9502_full -&gt; IGTPW_5310_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9502_full and IGTPW_5310_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic_transition@modeset-transition:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5310_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl6/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-hsw4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw4/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@gen3_render_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb5/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb7/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109288">fdo#109288</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109288">fdo#109288</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk9/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-apl6/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_color_chamelium@pipe-b-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-b:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl4/igt@kms_concurrent@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@kms_concurrent@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-apl8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-yf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb4/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@nouveau_crc@pipe-d-source-outp-inactive.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@nouveau_crc@pipe-d-source-outp-inactive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@prime_nv_test@i915_blt_fill_nv_read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@prime_nv_test@i915_blt_fill_nv_read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw4/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb8/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb1/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/300">i915#300</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-hsw5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9502/shard-tglb5/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/shard-tglb8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5908 -&gt; IGTPW_5310</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9502: 062fb02ead4596719cd755fc28bcb44858a3d80b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5310: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5310/index.html<br />
  IGT_5908: b8b1391f7bfff83397ddc47c0083c2c7ed06be37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8500536881980105469==--

--===============0992057250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0992057250==--
