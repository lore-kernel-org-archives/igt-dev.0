Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Apr 2020 04:37:38 -0000
Message-ID: <158709825875.10467.6666387420931462156@emeril.freedesktop.org>
References: <1587024219-3447-1-git-send-email-nidhi1.gupta@intel.com>
In-Reply-To: <1587024219-3447-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGVE?=
 =?utf-8?q?P_support_in_Link_Layer_Compliance_Tool_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add eDP support in Link Layer Compliance Tool (rev2)
URL   : https://patchwork.freedesktop.org/series/72783/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8307_full -> IGTPW_4473_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4473_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_schedule@pi-userfault@rcs0}:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk5/igt@gem_exec_schedule@pi-userfault@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-glk5/igt@gem_exec_schedule@pi-userfault@rcs0.html

  * {igt@gem_exec_schedule@pi-userfault@vecs0}:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk5/igt@gem_exec_schedule@pi-userfault@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-glk5/igt@gem_exec_schedule@pi-userfault@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8307_full and IGTPW_4473_full:

### New IGT tests (2) ###

  * igt@kms_flip@dpms-off-confusion-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [8.71] s

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@d-edp1:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  

Known issues
------------

  Here are the changes found in IGTPW_4473_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#1277])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb1/igt@gem_exec_balancer@hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#54])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-onscreen.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109349])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#433])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#165] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#1559] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1559] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#1085])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb8/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [INCOMPLETE][33] ([i915#61]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-hsw4/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][35] ([i915#454]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-iclb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][37] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][39] ([i915#1119] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][41] ([i915#1149]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb5/igt@kms_color@pipe-a-gamma.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb5/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [FAIL][43] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-apl:          [FAIL][45] ([i915#54] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
    - shard-glk:          [FAIL][49] ([i915#52] / [i915#54]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][51] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [FAIL][53] ([i915#64]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [INCOMPLETE][55] ([i915#456] / [i915#460]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb1/igt@kms_fbcon_fbt@psr-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb5/igt@kms_fbcon_fbt@psr-suspend.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [INCOMPLETE][57] ([i915#155]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * {igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1}:
    - shard-apl:          [INCOMPLETE][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl8/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl6/igt@kms_flip@plain-flip-ts-check-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [FAIL][65] ([i915#53] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [FAIL][67] ([i915#53] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#265] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][75] ([i915#468]) -> [FAIL][76] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [INCOMPLETE][77] ([i915#82]) -> [SKIP][78] ([fdo#109271]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-snb6/igt@i915_pm_rpm@fences.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-snb4/igt@i915_pm_rpm@fences.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         [INCOMPLETE][79] ([i915#1725]) -> [DMESG-FAIL][80] ([i915#1725])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-tglb6/igt@i915_selftest@live@gt_pm.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-tglb6/igt@i915_selftest@live@gt_pm.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][81] ([i915#95]) -> [DMESG-FAIL][82] ([i915#180] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][83] ([fdo#108145] / [i915#265]) -> [FAIL][84] ([fdo#108145] / [i915#265] / [i915#95]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          [FAIL][85] ([fdo#108145] / [i915#265]) -> [FAIL][86] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1725]: https://gitlab.freedesktop.org/drm/intel/issues/1725
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5591 -> IGTPW_4473
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8307: 547ca85e9cbca6fcfcadc6bf5e0e7b9a34a089d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4473: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/index.html
  IGT_5591: f57b7fdbe8d04ce3edf0433a03c7d9d5c3d96680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4473/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
