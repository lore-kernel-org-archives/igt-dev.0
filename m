Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8177421319888316747=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Dec 2021 09:05:46 -0000
Message-ID: <164025034608.20442.17797164014889438411@emeril.freedesktop.org>
References: <20211223071833.1600156-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20211223071833.1600156-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=3A_Optimize_ctm_test_execution?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8177421319888316747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Optimize ctm test execution
URL   : https://patchwork.freedesktop.org/series/98330/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11032_full -> IGTPW_6512_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/index.html

Participating hosts (10 -> 7)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6512_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling}:
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  
Known issues
------------

  Here are the changes found in IGTPW_6512_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#1839])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@feature_discovery@display-4x.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#2842])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#2849])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-kbl:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#4613]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl4/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#4613])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl7/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#4270]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#768])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#3297])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@gem_userptr_blits@access-control.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#3297])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb3/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][18] ([i915#3002])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl1/igt@gem_userptr_blits@input-checking.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109289]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb5/igt@gen3_render_tiledy_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109289]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb1/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#2856])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#2856])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb3/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#658]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][24] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#4281])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271]) +63 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl7/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109302])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109302])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110725] / [fdo#111614])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110723]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#2705])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3886]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3886])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109278] / [i915#3886]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615] / [i915#3689]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-snb2/igt@kms_chamelium@dp-hpd-fast.html
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk4/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_color_chamelium@pipe-a-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-max.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-c-gamma:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl7/igt@kms_color_chamelium@pipe-c-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][46] ([i915#1319])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][47] ([i915#1319])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][48] ([i915#2105])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +10 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109279] / [i915#3359]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3359]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271]) +15 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-snb7/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271]) +63 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl7/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#4103])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#79]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111825]) +18 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][62] -> [DMESG-WARN][63] ([i915#2867])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb4/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109285])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109280]) +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271]) +10 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][67] -> [SKIP][68] ([i915#433])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#1187])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb5/igt@kms_hdr@static-toggle-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#1187])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#533])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#533])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][74] ([fdo#108145] / [i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2733])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109441])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][78] ([i915#132] / [i915#3467])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111615]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#2437])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2530])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_test@i915_import_gtt_mmap:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109291])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@prime_nv_test@i915_import_gtt_mmap.html

  * igt@sysfs_clients@fair-3:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2994]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@sysfs_clients@fair-3.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#2994])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@split-25:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2994])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@sysfs_clients@split-25.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109307])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@tools_test@sysfs_l3_parity.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109307])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-tglb:         [TIMEOUT][90] ([i915#3063]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb1/igt@gem_eio@in-flight-contexts-immediate.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][92] ([i915#2846]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][94] ([i915#2842]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-glk:          [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][98] ([i915#2842]) -> [PASS][99] +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_schedule@wide@vcs1:
    - shard-kbl:          [INCOMPLETE][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl1/igt@gem_exec_schedule@wide@vcs1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl1/igt@gem_exec_schedule@wide@vcs1.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][102] ([i915#180]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-iclb:         [SKIP][104] -> [PASS][105] +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb5/igt@gem_workarounds@suspend-resume.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb3/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][106] ([i915#454]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][110] ([i915#118]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][112] ([i915#2346]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][114] ([i915#180] / [i915#1982]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][116] ([i915#79]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [FAIL][118] ([i915#1888] / [i915#2546]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [INCOMPLETE][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-iclb:         [FAIL][122] ([i915#2546]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [DMESG-WARN][124] ([i915#2411] / [i915#2867]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][126] ([i915#794]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][128] ([fdo#109441]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][130] ([i915#31]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk1/igt@kms_setmode@basic.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk3/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][132] ([i915#232]) -> [TIMEOUT][133] ([i915#3063] / [i915#3648])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb1/igt@gem_eio@unwedge-stress.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][134] ([i915#2852]) -> [FAIL][135] ([i915#2842])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][136] ([i915#2842]) -> [FAIL][137] ([i915#2851])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][138] ([i915#1804] / [i915#2684]) -> [WARN][139] ([i915#2684])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][140] ([i915#2920]) -> [SKIP][141] ([fdo#111068] / [i915#658])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [141]: https://in

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/index.html

--===============8177421319888316747==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Optimize ctm test execution</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98330/">https://patchwork.freedesktop.org/series/98330/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11032_full -&gt; IGTPW_6512_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/index.html</p>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6512_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling}:<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6512_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> ([i915#118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl4/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl7/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl1/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl8/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb3/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb5/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb1/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb3/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl7/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([fdo#109271]) +63 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([fdo#110723]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-snb2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk4/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-gamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl7/igt@kms_color_chamelium@pipe-c-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html">SKIP</a> ([fdo#109278]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-snb7/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html">SKIP</a> ([fdo#109271]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl7/igt@kms_cursor_edge_walk@pipe-d-64x64-left-edge.html">SKIP</a> ([fdo#109271]) +63 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([fdo#111825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb4/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> ([i915#2867])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_gtt_mmap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@prime_nv_test@i915_import_gtt_mmap.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb7/igt@sysfs_clients@fair-3.html">SKIP</a> ([i915#2994]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@sysfs_clients@fair-3.html">SKIP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl2/igt@sysfs_clients@split-25.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb8/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb1/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a> ([i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@gem_eio@in-flight-contexts-immediate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@wide@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl1/igt@gem_exec_schedule@wide@vcs1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl1/igt@gem_exec_schedule@wide@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl4/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb5/igt@gem_workarounds@suspend-resume.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb3/igt@gem_workarounds@suspend-resume.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> ([i915#1888] / [i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">FAIL</a> ([i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb5/igt@kms_frontbuffer_tracking@psr-suspend.html">DMESG-WARN</a> ([i915#2411] / [i915#2867]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb6/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> ([i915#794]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk1/igt@kms_setmode@basic.html">FAIL</a> ([i915#31]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk3/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#232]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2851])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6512/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11032/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://in">SKIP</a> ([fdo#111068] / [i915#658])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8177421319888316747==--
