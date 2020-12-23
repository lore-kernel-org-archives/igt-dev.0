Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 23 Dec 2020 21:42:26 -0000
Message-ID: <160875974638.26587.459606475745582006@emeril.freedesktop.org>
References: <20201223161152.289279-1-matthew.auld@intel.com>
In-Reply-To: <20201223161152.289279-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS90?=
 =?utf-8?q?ests=3A_shadow_peek?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0751712502=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0751712502==
Content-Type: multipart/alternative;
 boundary="===============4545894313689889165=="

--===============4545894313689889165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/tests: shadow peek
URL   : https://patchwork.freedesktop.org/series/85190/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9517_full -> IGTPW_5325_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5325_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5325_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5325_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@wide@rcs0:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb3/igt@gem_exec_schedule@wide@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@gem_exec_schedule@wide@rcs0.html

  * {igt@gen9_exec_parse@shadow-peek} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl6/igt@gen9_exec_parse@shadow-peek.html
    - shard-iclb:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb2/igt@gen9_exec_parse@shadow-peek.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-apl:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl3/igt@gem_exec_schedule@u-fairslice@rcs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9517_full and IGTPW_5325_full:

### New IGT tests (1) ###

  * igt@gen9_exec_parse@shadow-peek:
    - Statuses : 1 fail(s) 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_5325_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [PASS][10] -> [DMESG-WARN][11] ([i915#118] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk4/igt@gem_exec_create@madvise.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk7/igt@gem_exec_create@madvise.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-kbl:          NOTRUN -> [TIMEOUT][12] ([i915#1729])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl4/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#768])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gen3_render_tiledx_blits:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109289])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb8/igt@gen3_render_tiledx_blits.html

  * {igt@gen9_exec_parse@shadow-peek} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-snb5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#454])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-kbl:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl3/igt@i915_pm_rpm@dpms-non-lpsp.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110892])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#111644] / [i915#1397] / [i915#2411])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-kbl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl4/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk4/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl7/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#129])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-apl4/igt@kms_color@pipe-b-ctm-green-to-red.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl4/igt@kms_color@pipe-b-ctm-green-to-red.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#129])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl2/igt@kms_color@pipe-b-ctm-green-to-red.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl3/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_color@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109278] / [i915#1149])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_color@pipe-d-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109278] / [fdo#109279])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109279])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109274] / [fdo#109278])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#2346])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +20 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111825]) +7 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109274]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#2672])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109280]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +53 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl4/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([i915#433])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#533])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk6/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-pipe-d-planes:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-pipe-d-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][49] ([i915#265])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][50] ([fdo#108145] / [i915#265])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_cursor@pipe-d-viewport-size-256:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271]) +31 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk7/igt@kms_plane_cursor@pipe-d-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#112054])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109441])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb5/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][56] -> [SKIP][57] ([i915#2648])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-hsw:          [PASS][58] -> [SKIP][59] ([fdo#109271]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][60] -> [SKIP][61] ([fdo#109278])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-apl:          [PASS][62] -> [SKIP][63] ([fdo#109271]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
    - shard-glk:          [PASS][64] -> [SKIP][65] ([fdo#109271]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@prime_nv_pcopy@test1_micro:
    - shard-hsw:          NOTRUN -> [SKIP][66] ([fdo#109271]) +9 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-hsw1/igt@prime_nv_pcopy@test1_micro.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109291])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@prime_nv_pcopy@test1_micro.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109291])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@prime_nv_pcopy@test1_micro.html

  
#### Possible fixes ####

  * {igt@gem_exec_balancer@fairslice}:
    - shard-iclb:         [FAIL][69] ([i915#2802]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb4/igt@gem_exec_balancer@fairslice.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb2/igt@gem_exec_balancer@fairslice.html

  * {igt@gem_exec_fair@basic-deadline}:
    - shard-kbl:          [FAIL][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * {igt@gem_exec_fair@basic-none-solo@rcs0}:
    - shard-glk:          [FAIL][73] ([i915#2842]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * {igt@gem_exec_fair@basic-none@bcs0}:
    - shard-iclb:         [FAIL][75] ([i915#2842]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb8/igt@gem_exec_fair@basic-none@bcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb5/igt@gem_exec_fair@basic-none@bcs0.html

  * {igt@gem_exec_fair@basic-none@rcs0}:
    - shard-kbl:          [FAIL][77] ([i915#2842]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl1/igt@gem_exec_fair@basic-none@rcs0.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-tglb:         [FAIL][79] ([i915#2842]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][81] ([i915#2389]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][83] ([i915#118] / [i915#95]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [SKIP][85] ([i915#579]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-iclb:         [SKIP][87] ([i915#579]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl6/igt@i915_suspend@forcewake.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][91] ([i915#96]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][95] ([i915#1602] / [i915#2635]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-iclb:         [DMESG-WARN][97] ([i915#1602]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-glk:          [DMESG-WARN][99] ([i915#1602] / [i915#2635]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-hsw:          [DMESG-WARN][101] ([i915#2637]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [DMESG-WARN][103] ([i915#1602]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][105] ([i915#1436] / [i915#1982] / [i915#2841]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][107] ([i915#2684]) -> [WARN][108] ([i915#1804] / [i915#2684])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][109] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][110] ([i915#579])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][111] ([fdo#110892]) -> [SKIP][112] ([i915#579])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][113] ([i915#2597]) -> [FAIL][114] ([i915#2574])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb8/igt@kms_async_flips@test-time-stamp.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118]) ([i915#1814] / [i915#2295] / [i915#483] / [i915#602]) -> ([FAIL][119], [FAIL][120], [FAIL][121]) ([i915#1436] / [i915#2295] / [i915#2426] / [i915#483])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl4/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl1/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl6/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl3/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][122], [FAIL][123]) ([i915#1814] / [i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][124], [FAIL][125]) ([i915#2295] / [i915#2426] / [i915#2724] / [i915#483])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb7/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb5/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][126], [FAIL][127]) ([i915#1814] / [i915#2295]) -> ([FAIL][128], [FAIL][129]) ([i915#1610] / [i915#2295] / [i915#2426])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-apl4/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-apl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl8/igt@runner@aborted.html
    - shard-glk:          ([FAIL][130], [FAIL][131]) ([i915#1814] / [i915#2295] / [k.org#202321]) -> ([FAIL][132], [FAIL][133]) ([i915#2295] / [i915#2426] / [k.org#202321])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk9/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk8/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk9/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][134], [FAIL][135]) ([i915#1602] / [i915#2295] / [i915#2667]) -> [FAIL][136] ([i915#2295] / [i915#2667])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb3/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tglb2/igt@runner@aborted.html

  
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
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1729]: https://gitlab.freedesktop.org/drm/intel/issues/1729
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2841]: https://gitlab.freedesktop.org/drm/intel/issues/2841
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5920 -> IGTPW_5325
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9517: 325ec6b5e94e6b2b5c9be9a8234fdf698c2ee18d @

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/index.html

--===============4545894313689889165==
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
<tr><td><b>Series:</b></td><td>i915/tests: shadow peek</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85190/">https://patchwork.freedesktop.org/series/85190/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5325/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9517_full -&gt; IGTPW_5325_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5325_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5325_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5325=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@wide@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-tglb3/igt@gem_exec_schedule@wide@rcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tgl=
b5/igt@gem_exec_schedule@wide@rcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@gen9_exec_parse@shadow-peek} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-tglb5/igt@gen9_exec_parse@shadow-peek.html">S=
KIP</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-apl6/igt@gen9_exec_parse@shadow-peek.html">FA=
IL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-iclb2/igt@gen9_exec_parse@shadow-peek.html">S=
KIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_exec_schedule@u-fairslice@rcs0}:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-apl8/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/sha=
rd-apl3/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9517_full and IGTPW_5325_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gen9_exec_parse@shadow-peek:<ul>
<li>Statuses : 1 fail(s) 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5325_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325=
/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-glk4/igt@gem_exec_create@madvise.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk7/igt=
@gem_exec_create@madvise.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-kbl4/igt@gem_exec_reloc@basic-parallel.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/17=
29">i915#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-tglb8/igt@gen3_render_tiledx_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>)</li>
</ul>
</li>
<li>
<p>{igt@gen9_exec_parse@shadow-peek} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-snb5/igt@gen9_exec_parse@shadow-peek.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb6/igt@i9=
15_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-kbl3/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl7/i=
gt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892"=
>fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644"=
>fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-kbl4/igt@kms_chamelium@hdmi-mode-timings.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_chamelium@hdmi-mode-timings.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-glk4/igt@kms_chamelium@hdmi-mode-timings.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-apl7/igt@kms_chamelium@hdmi-mode-timings.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-apl4/igt@kms_color@pipe-b-ctm-green-to-red.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard=
-apl4/igt@kms_color@pipe-b-ctm-green-to-red.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-kbl2/igt@kms_color@pipe-b-ctm-green-to-red.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard=
-kbl3/igt@kms_color@pipe-b-ctm-green-to-red.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/129">i915#129</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_color@pipe-d-ctm-red-to-blue.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x51=
2-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x51=
2-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_532=
5/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-apl4/igt@kms_flip@2x-flip-vs-absolute-wf_vbla=
nk-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +20 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-tglb5/igt@kms_flip@2x-flip-vs-absolute-wf_vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-iclb4/igt@kms_flip@2x-flip-vs-absolute-wf_vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-kbl4/igt@kms_frontbuffer_tracking@psr-farfro=
mfence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-tg=
lb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-glk6/igt@kms_pipe_crc_basic@disable-crc-afte=
r-crtc-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-pipe-d-planes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-iclb3/igt@kms_plane@plane-panning-bottom-rig=
ht-pipe-d-planes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-viewport-size-256:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-glk7/igt@kms_plane_cursor@pipe-d-viewport-si=
ze-256.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
12054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5325/shard-iclb4/igt@kms_psr@psr2_no_drrs.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb=
5/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5325/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2648">i915#=
2648</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-hsw7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
325/shard-hsw1/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5325/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#=
109278</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
325/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-glk8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
325/shard-glk2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_micro:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-hsw1/igt@prime_nv_pcopy@test1_micro.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a>) +9 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-tglb5/igt@prime_nv_pcopy@test1_micro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5325/shard-iclb4/igt@prime_nv_pcopy@test1_micro.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">f=
do#109291</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-iclb4/igt@gem_exec_balancer@fairslice.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2802">i915#2802</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/sha=
rd-iclb2/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-deadline}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl=
7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-solo@rcs0}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
25/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +3 simi=
lar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@bcs0}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-iclb8/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/s=
hard-iclb5/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-kbl4/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/sh=
ard-kbl1/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +2 similar issues=
</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5325/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i91=
5#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5325/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5325/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html=
">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/s=
hard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/s=
hard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-kbl6/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard=
-kbl2/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/96">i915#96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5325/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5325/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspe=
nd.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1602">i915#1602</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5325/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-suspend.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5325/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-suspe=
nd.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5325/shard-hsw2/igt@kms_vblank@pipe-b-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1602">i915#1602</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5325/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2841">i915#2841</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5325/shard-tglb5/igt@kms_vblank@pipe-d-ts-continuat=
ion-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325=
/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#13=
97</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i=
915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5325/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9517/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shar=
d-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325=
/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2574">i915#2574</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9517/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-kbl1/igt@runner@aborted.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/602">i915#602</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5325/shard-kbl6/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-kbl3/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5325/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2426">i915=
#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483"=
>i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-iclb5/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-iclb7/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/sh=
ard-iclb4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-apl4/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5325/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-apl8/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2426">i915#2426</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://bugzilla.kernel.org/show=
_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5325/shard-glk2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5325/shard-=
glk9/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://bug=
zilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9517/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9517/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2667">i915#2667</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5325/shard-tglb2/igt@runner@aborted.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2667"=
>i915#2667</a>)</p>
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
<li>IGT: IGT_5920 -&gt; IGTPW_5325</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9517: 325ec6b5e94e6b2b5c9be9a8234fdf698c2ee18d @</p>

</body>
</html>

--===============4545894313689889165==--

--===============0751712502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0751712502==--
