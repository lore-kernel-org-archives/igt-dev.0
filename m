Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524B6E970
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2020 23:02:23 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 8 Jul 2020 23:02:21 +0000
Message-ID: <790c69473d29d746f014feda22354f7721385cd2.camel@intel.com>
References: <20200708174252.25699-1-jose.souza@intel.com>
 <159424904612.3840.545852137952393335@emeril.freedesktop.org>
In-Reply-To: <159424904612.3840.545852137952393335@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <0A3EAF2F7AADAE45BB08C66DCB6B44A2@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBT?=
 =?utf-8?q?ync_i915_PCI_ids?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 2020-07-08 at 22:57 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib: Sync i915 PCI ids
> URL   : https://patchwork.freedesktop.org/series/79261/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8715_full -> IGTPW_4750_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4750_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4750_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4750_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt:
>     - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb8/igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-iclb4/igt@gem_userptr_blits@invalid-mmap-offset-unsync@gtt.html


Not related with this changes, pushed.Thanks for the review Matt.

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4750_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180] / [i915#93] / [i915#95])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_exec_whisper@basic-contexts-all:
>     - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +2 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk1/igt@gem_exec_whisper@basic-contexts-all.html
> 
>   * igt@gem_mmap_gtt@basic-small-copy-xy:
>     - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#402])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb3/igt@gem_mmap_gtt@basic-small-copy-xy.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-tglb2/igt@gem_mmap_gtt@basic-small-copy-xy.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#1436] / [i915#716])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk8/igt@gen9_exec_parse@allowed-all.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk2/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@i915_pm_rps@reset:
>     - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1635] / [i915#95]) +40 similar issues
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl3/igt@i915_pm_rps@reset.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl2/igt@i915_pm_rps@reset.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
>     - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +2 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
>     - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#1958] / [i915#2119])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
> 
>   * igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge:
>     - shard-snb:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +2 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb2/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-snb6/igt@kms_cursor_edge_walk@pipe-a-64x64-bottom-edge.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#64])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
>     - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1525])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl4/igt@kms_fbcon_fbt@fbc.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl4/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
>     - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp1:
>     - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race@a-edp1:
>     - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +2 similar issues
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb1/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-tglb2/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#1635] / [i915#49] / [i915#95])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>     - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#49])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
>     - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([fdo#108145] / [i915#95])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>     - shard-apl:          [PASS][37] -> [DMESG-FAIL][38] ([fdo#108145] / [i915#1635] / [i915#95])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_prime@basic-crc@second-to-first:
>     - shard-apl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#1635] / [i915#95])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl4/igt@kms_prime@basic-crc@second-to-first.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
>     - shard-kbl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#95])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html
> 
>   * igt@kms_psr@psr2_sprite_plane_move:
>     - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +3 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
> 
>   * igt@kms_vblank@pipe-a-accuracy-idle:
>     - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#43])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk3/igt@kms_vblank@pipe-a-accuracy-idle.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk2/igt@kms_vblank@pipe-a-accuracy-idle.html
> 
>   * igt@syncobj_wait@multi-wait-all-for-submit-submitted-signaled:
>     - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#93] / [i915#95]) +42 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@syncobj_wait@multi-wait-all-for-submit-submitted-signaled.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl3/igt@syncobj_wait@multi-wait-all-for-submit-submitted-signaled.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_balancer@bonded-early:
>     - shard-iclb:         [FAIL][49] ([i915#926]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb1/igt@gem_exec_balancer@bonded-early.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-iclb4/igt@gem_exec_balancer@bonded-early.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-glk:          [FAIL][51] ([i915#1930]) -> [PASS][52]
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_exec_whisper@basic-normal:
>     - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54] +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk9/igt@gem_exec_whisper@basic-normal.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk7/igt@gem_exec_whisper@basic-normal.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-tglb:         [DMESG-WARN][55] ([i915#402]) -> [PASS][56] +1 similar issue
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_addfb_basic@unused-pitches:
>     - shard-kbl:          [DMESG-WARN][57] ([i915#93] / [i915#95]) -> [PASS][58] +38 similar issues
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl1/igt@kms_addfb_basic@unused-pitches.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl2/igt@kms_addfb_basic@unused-pitches.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-180:
>     - shard-kbl:          [DMESG-FAIL][59] ([i915#95]) -> [PASS][60] +1 similar issue
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl4/igt@kms_big_fb@linear-16bpp-rotate-180.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html
>     - shard-apl:          [DMESG-FAIL][61] ([i915#1635] / [i915#95]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_big_fb@linear-16bpp-rotate-180.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl7/igt@kms_big_fb@linear-16bpp-rotate-180.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
>     - shard-apl:          [DMESG-WARN][63] ([i915#1635] / [i915#95]) -> [PASS][64] +33 similar issues
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
>     - shard-kbl:          [DMESG-FAIL][65] ([i915#54] / [i915#95]) -> [PASS][66] +2 similar issues
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [FAIL][67] ([i915#1525]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
>     - shard-hsw:          [INCOMPLETE][69] ([i915#2055]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-dp1:
>     - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +4 similar issues
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_flip@flip-vs-suspend@b-dp1.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl6/igt@kms_flip@flip-vs-suspend@b-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
>     - shard-kbl:          [FAIL][73] ([i915#49]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>     - shard-apl:          [FAIL][75] ([i915#49]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-badstride:
>     - shard-glk:          [DMESG-WARN][77] ([i915#1982]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-glk4/igt@kms_frontbuffer_tracking@fbc-badstride.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
>     - shard-tglb:         [DMESG-WARN][79] ([i915#1982]) -> [PASS][80] +3 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_plane_cursor@pipe-b-primary-size-128:
>     - shard-hsw:          [INCOMPLETE][81] -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw7/igt@kms_plane_cursor@pipe-b-primary-size-128.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-hsw6/igt@kms_plane_cursor@pipe-b-primary-size-128.html
> 
>   * igt@kms_psr@psr2_cursor_plane_move:
>     - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
> 
>   * igt@kms_setmode@basic:
>     - shard-kbl:          [FAIL][85] ([i915#31]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl2/igt@kms_setmode@basic.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl1/igt@kms_setmode@basic.html
> 
>   * igt@perf_pmu@semaphore-busy@rcs0:
>     - shard-kbl:          [FAIL][87] ([i915#1820]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_exec_reloc@basic-concurrent16:
>     - shard-snb:          [FAIL][89] ([i915#1930]) -> [TIMEOUT][90] ([i915#1958] / [i915#2119])
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
> 
>   * igt@gem_vm_create@execbuf:
>     - shard-hsw:          [TIMEOUT][91] ([i915#1958] / [i915#2119]) -> [SKIP][92] ([fdo#109271]) +1 similar issue
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw8/igt@gem_vm_create@execbuf.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-hsw1/igt@gem_vm_create@execbuf.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-iclb:         [WARN][93] ([i915#1515]) -> [FAIL][94] ([i915#1515])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@kms_chamelium@dp-hpd-with-enabled-mode:
>     - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][96] ([fdo#109271] / [fdo#111827])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
> 
>   * igt@kms_color_chamelium@pipe-b-gamma:
>     - shard-apl:          [SKIP][97] ([fdo#109271] / [fdo#111827]) -> [SKIP][98] ([fdo#109271] / [fdo#111827] / [i915#1635])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl2/igt@kms_color_chamelium@pipe-b-gamma.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl1/igt@kms_color_chamelium@pipe-b-gamma.html
> 
>   * igt@kms_color_chamelium@pipe-d-degamma:
>     - shard-snb:          [SKIP][99] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][100] ([i915#1958] / [i915#2119])
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb6/igt@kms_color_chamelium@pipe-d-degamma.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-snb1/igt@kms_color_chamelium@pipe-d-degamma.html
>     - shard-hsw:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][102] ([i915#1958] / [i915#2119])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw7/igt@kms_color_chamelium@pipe-d-degamma.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-hsw1/igt@kms_color_chamelium@pipe-d-degamma.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-apl:          [DMESG-FAIL][103] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][104] ([fdo#110321] / [fdo#110336])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_content_protection@atomic-dpms.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl1/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-apl:          [SKIP][105] ([fdo#109271] / [i915#1635]) -> [SKIP][106] ([fdo#109271]) +8 similar issues
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-kbl:          [FAIL][107] ([i915#64]) -> [DMESG-WARN][108] ([i915#180])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
>     - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119]) +1 similar issue
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-hsw2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html
>     - shard-snb:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958] / [i915#2119]) +2 similar issues
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-snb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>     - shard-apl:          [DMESG-FAIL][113] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][114] ([fdo#108145] / [i915#265])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
> 
>   * igt@kms_vblank@pipe-b-ts-continuation-suspend:
>     - shard-kbl:          [DMESG-WARN][115] ([i915#93] / [i915#95]) -> [DMESG-WARN][116] ([i915#180])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
> 
>   * igt@kms_vblank@pipe-d-ts-continuation-idle:
>     - shard-apl:          [SKIP][117] ([fdo#109271]) -> [SKIP][118] ([fdo#109271] / [i915#1635]) +12 similar issues
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl2/igt@kms_vblank@pipe-d-ts-continuation-idle.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl4/igt@kms_vblank@pipe-d-ts-continuation-idle.html
> 
>   * igt@runner@aborted:
>     - shard-iclb:         ([FAIL][119], [FAIL][120]) ([i915#2110]) -> ([FAIL][121], [FAIL][122]) ([i915#2102] / [i915#2110])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb8/igt@runner@aborted.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-iclb5/igt@runner@aborted.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-iclb4/igt@runner@aborted.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-iclb1/igt@runner@aborted.html
>     - shard-apl:          ([FAIL][123], [FAIL][124], [FAIL][125]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][126] ([i915#1635] / [i915#2110])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl1/igt@runner@aborted.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl3/igt@runner@aborted.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8715/shard-apl2/igt@runner@aborted.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/shard-apl2/igt@runner@aborted.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
>   [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
>   [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
>   [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
>   [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
>   [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
>   [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
>   [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
>   [i915#2102]: https://gitlab.freedesktop.org/drm/intel/issues/2102
>   [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
>   [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
>   [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
>   [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
>   [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
> 
> 
> Participating hosts (10 -> 8)
> ------------------------------
> 
>   Missing    (2): pig-skl-6260u pig-glk-j5005 
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5728 -> IGTPW_4750
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_8715: 76c2d43437601608d75f61a9eb6cf3a7aae5e02b @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4750: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/index.html
>   IGT_5728: 6988eebf78e9ce9746b8c2b7d21cb4174d6623a9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4750/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
