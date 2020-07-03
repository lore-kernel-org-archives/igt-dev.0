Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF866E29E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2020 14:50:27 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <159378548478.25591.5679004803635350441@emeril.freedesktop.org>
References: <20200703112333.4237-1-mika.kuoppala@linux.intel.com>
 <159378548478.25591.5679004803635350441@emeril.freedesktop.org>
Date: Fri, 03 Jul 2020 17:50:12 +0300
Message-ID: <874kqo4pqz.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBG?=
 =?utf-8?q?ix_interface_descriptor_fills?=
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
To: Patchwork <patchwork@emeril.freedesktop.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Patchwork <patchwork@emeril.freedesktop.org> writes:

> == Series Details ==
>
> Series: lib: Fix interface descriptor fills
> URL   : https://patchwork.freedesktop.org/series/79088/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from CI_DRM_8706_full -> IGTPW_4733_full
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with IGTPW_4733_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4733_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/index.html
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in IGTPW_4733_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@gem_unref_active_buffers:
>     - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw2/igt@gem_unref_active_buffers.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-hsw6/igt@gem_unref_active_buffers.html

the affected library part is not in this tests codepath so fluke.
-Mika

>
>   * igt@perf@gen12-mi-rpc:
>     - shard-tglb:         [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb6/igt@perf@gen12-mi-rpc.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb8/igt@perf@gen12-mi-rpc.html
>
>   
> #### Warnings ####
>
>   * igt@perf@gen12-mi-rpc:
>     - shard-iclb:         [SKIP][5] ([fdo#109289]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb3/igt@perf@gen12-mi-rpc.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb4/igt@perf@gen12-mi-rpc.html
>
>   
> Known issues
> ------------
>
>   Here are the changes found in IGTPW_4733_full that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@gem_ctx_isolation@nonpriv-switch@vecs0:
>     - shard-iclb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1226])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb1/igt@gem_ctx_isolation@nonpriv-switch@vecs0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb2/igt@gem_ctx_isolation@nonpriv-switch@vecs0.html
>
>   * igt@gem_ctx_shared@q-smoketest-all:
>     - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +2 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk8/igt@gem_ctx_shared@q-smoketest-all.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html
>
>   * igt@i915_pm_rpm@pm-caching:
>     - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#402])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb3/igt@i915_pm_rpm@pm-caching.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb7/igt@i915_pm_rpm@pm-caching.html
>
>   * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
>     - shard-apl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
>
>   * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
>     - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +5 similar issues
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
>
>   * igt@kms_cursor_legacy@all-pipes-torture-bo:
>     - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#93] / [i915#95]) +42 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl4/igt@kms_cursor_legacy@all-pipes-torture-bo.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl7/igt@kms_cursor_legacy@all-pipes-torture-bo.html
>
>   * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1635] / [i915#95]) +30 similar issues
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl7/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
>
>   * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
>     - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
>
>   * igt@kms_draw_crc@fill-fb:
>     - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#1635] / [i915#95])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl3/igt@kms_draw_crc@fill-fb.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl6/igt@kms_draw_crc@fill-fb.html
>
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#64])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl6/igt@kms_fbcon_fbt@fbc.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl1/igt@kms_fbcon_fbt@fbc.html
>     - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1525])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl2/igt@kms_fbcon_fbt@fbc.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl3/igt@kms_fbcon_fbt@fbc.html
>
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#1185])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb2/igt@kms_fbcon_fbt@psr-suspend.html
>
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
>     - shard-snb:          [PASS][31] -> [TIMEOUT][32] ([i915#1958] / [i915#2119]) +2 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
>     - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
>
>   * igt@kms_frontbuffer_tracking@fbc-stridechange:
>     - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +4 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
>
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#83])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb2/igt@kms_panel_fitting@atomic-fastset.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-iclb:         [PASS][39] -> [FAIL][40] ([i915#83])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html
>
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
>     - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +2 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
>
>   * igt@kms_psr@psr2_cursor_render:
>     - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
>
>   * igt@kms_setmode@basic:
>     - shard-hsw:          [PASS][45] -> [FAIL][46] ([i915#31])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw6/igt@kms_setmode@basic.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-hsw1/igt@kms_setmode@basic.html
>
>   * igt@kms_sysfs_edid_timing:
>     - shard-iclb:         [PASS][47] -> [FAIL][48] ([IGT#2])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb1/igt@kms_sysfs_edid_timing.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb2/igt@kms_sysfs_edid_timing.html
>
>   * igt@perf@invalid-remove-userspace-config:
>     - shard-iclb:         [PASS][49] -> [SKIP][50] ([i915#405])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb4/igt@perf@invalid-remove-userspace-config.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb4/igt@perf@invalid-remove-userspace-config.html
>     - shard-hsw:          [PASS][51] -> [SKIP][52] ([fdo#109271])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw1/igt@perf@invalid-remove-userspace-config.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-hsw4/igt@perf@invalid-remove-userspace-config.html
>     - shard-kbl:          [PASS][53] -> [SKIP][54] ([fdo#109271])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl3/igt@perf@invalid-remove-userspace-config.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl1/igt@perf@invalid-remove-userspace-config.html
>     - shard-apl:          [PASS][55] -> [SKIP][56] ([fdo#109271])
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl8/igt@perf@invalid-remove-userspace-config.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl6/igt@perf@invalid-remove-userspace-config.html
>     - shard-glk:          [PASS][57] -> [SKIP][58] ([fdo#109271])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk4/igt@perf@invalid-remove-userspace-config.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-glk6/igt@perf@invalid-remove-userspace-config.html
>     - shard-tglb:         [PASS][59] -> [SKIP][60] ([i915#405])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb8/igt@perf@invalid-remove-userspace-config.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb8/igt@perf@invalid-remove-userspace-config.html
>
>   * igt@syncobj_wait@single-wait-submitted:
>     - shard-hsw:          [PASS][61] -> [TIMEOUT][62] ([i915#1958] / [i915#2119])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw4/igt@syncobj_wait@single-wait-submitted.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-hsw6/igt@syncobj_wait@single-wait-submitted.html
>
>   
> #### Possible fixes ####
>
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-glk:          [FAIL][63] ([i915#1930]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html
>
>   * igt@gem_exec_whisper@basic-forked-all:
>     - shard-glk:          [DMESG-WARN][65] ([i915#118] / [i915#95]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html
>
>   * igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc:
>     - shard-iclb:         [INCOMPLETE][67] -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb8/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb4/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html
>
>   * igt@i915_module_load@reload:
>     - shard-iclb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb4/igt@i915_module_load@reload.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb5/igt@i915_module_load@reload.html
>
>   * igt@i915_suspend@sysfs-reader:
>     - shard-kbl:          [INCOMPLETE][71] ([i915#155]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl3/igt@i915_suspend@sysfs-reader.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl4/igt@i915_suspend@sysfs-reader.html
>
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-kbl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
>
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-glk:          [DMESG-FAIL][75] ([i915#118] / [i915#95]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-glk4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>
>   * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
>     - shard-kbl:          [DMESG-FAIL][77] ([i915#54] / [i915#95]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
>
>   * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
>     - shard-hsw:          [TIMEOUT][79] ([i915#1958] / [i915#2119]) -> [PASS][80] +3 similar issues
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-hsw5/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
>
>   * igt@kms_cursor_legacy@pipe-c-forked-bo:
>     - shard-apl:          [DMESG-WARN][81] ([i915#1635] / [i915#95]) -> [PASS][82] +29 similar issues
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl8/igt@kms_cursor_legacy@pipe-c-forked-bo.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl7/igt@kms_cursor_legacy@pipe-c-forked-bo.html
>
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-iclb:         [FAIL][83] -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb2/igt@kms_fbcon_fbt@fbc.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb6/igt@kms_fbcon_fbt@fbc.html
>
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [FAIL][85] ([i915#1525]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
>
>   * igt@kms_flip@flip-vs-suspend@c-dp1:
>     - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +4 similar issues
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
>
>   * igt@kms_flip_tiling@flip-changes-tiling-y:
>     - shard-apl:          [DMESG-FAIL][89] ([i915#1635] / [i915#95]) -> [PASS][90] +1 similar issue
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
>
>   * igt@kms_frontbuffer_tracking@basic:
>     - shard-snb:          [TIMEOUT][91] ([i915#1958] / [i915#2119]) -> [PASS][92] +1 similar issue
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-snb1/igt@kms_frontbuffer_tracking@basic.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-snb2/igt@kms_frontbuffer_tracking@basic.html
>
>   * igt@kms_frontbuffer_tracking@fbc-farfromfence:
>     - shard-kbl:          [DMESG-WARN][93] ([i915#93] / [i915#95]) -> [PASS][94] +37 similar issues
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
>
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-tglb:         [DMESG-WARN][95] ([i915#1982]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
>
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-tglb:         [SKIP][97] ([i915#433]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
>
>   * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
>     - shard-kbl:          [DMESG-FAIL][99] ([fdo#108145] / [i915#95]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>     - shard-apl:          [DMESG-FAIL][101] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][102] +1 similar issue
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
>
>   * igt@kms_psr@psr2_sprite_mmap_cpu:
>     - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_cpu.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
>
>   * igt@kms_vblank@pipe-a-query-idle-hang:
>     - shard-hsw:          [INCOMPLETE][105] -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw1/igt@kms_vblank@pipe-a-query-idle-hang.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-hsw6/igt@kms_vblank@pipe-a-query-idle-hang.html
>
>   * igt@kms_vblank@pipe-c-accuracy-idle:
>     - shard-glk:          [FAIL][107] ([i915#43]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-glk2/igt@kms_vblank@pipe-c-accuracy-idle.html
>
>   
> #### Warnings ####
>
>   * igt@gem_exec_reloc@basic-concurrent16:
>     - shard-kbl:          [INCOMPLETE][109] ([i915#1958] / [i915#95]) -> [INCOMPLETE][110] ([i915#1958])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl2/igt@gem_exec_reloc@basic-concurrent16.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl1/igt@gem_exec_reloc@basic-concurrent16.html
>
>   * igt@i915_module_load@reload:
>     - shard-tglb:         [DMESG-WARN][111] ([i915#402]) -> [DMESG-WARN][112] ([i915#1982])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb8/igt@i915_module_load@reload.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-tglb6/igt@i915_module_load@reload.html
>
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-iclb:         [SKIP][113] ([i915#658]) -> [SKIP][114] ([i915#588])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
>
>   * igt@i915_pm_dc@dc6-dpms:
>     - shard-kbl:          [DMESG-FAIL][115] ([i915#95]) -> [FAIL][116] ([i915#454])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html
>
>   * igt@kms_color_chamelium@pipe-d-ctm-0-5:
>     - shard-apl:          [SKIP][117] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][118] ([fdo#109271] / [fdo#111827]) +1 similar issue
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl4/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl6/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
>
>   * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
>     - shard-apl:          [SKIP][119] ([fdo#109271] / [fdo#111827]) -> [SKIP][120] ([fdo#109271] / [fdo#111827] / [i915#1635]) +2 similar issues
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl8/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl7/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
>
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-apl:          [FAIL][121] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][122] ([fdo#110321] / [i915#1635] / [i915#95])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl6/igt@kms_content_protection@atomic-dpms.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl4/igt@kms_content_protection@atomic-dpms.html
>
>   * igt@kms_content_protection@srm:
>     - shard-apl:          [DMESG-FAIL][123] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][124] ([fdo#110321])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl4/igt@kms_content_protection@srm.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl3/igt@kms_content_protection@srm.html
>
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-kbl:          [FAIL][125] ([i915#64]) -> [DMESG-WARN][126] ([i915#180])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
>
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-hsw:          [SKIP][127] ([fdo#109271]) -> [TIMEOUT][128] ([i915#1958] / [i915#2119]) +1 similar issue
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-blt.html
>
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-apl:          [SKIP][129] ([fdo#109271]) -> [SKIP][130] ([fdo#109271] / [i915#1635]) +12 similar issues
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
>
>   * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
>     - shard-kbl:          [DMESG-FAIL][131] ([i915#95]) -> [DMESG-WARN][132] ([i915#180])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
>
>   * igt@kms_psr@sprite_plane_onoff:
>     - shard-snb:          [SKIP][133] ([fdo#109271]) -> [TIMEOUT][134] ([i915#1958] / [i915#2119]) +1 similar issue
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-snb5/igt@kms_psr@sprite_plane_onoff.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-snb1/igt@kms_psr@sprite_plane_onoff.html
>
>   * igt@kms_vblank@pipe-d-wait-idle:
>     - shard-apl:          [SKIP][135] ([fdo#109271] / [i915#1635]) -> [SKIP][136] ([fdo#109271]) +13 similar issues
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html
>
>   * igt@perf_pmu@rc6-runtime-pm-long:
>     - shard-snb:          [TIMEOUT][137] ([i915#1958] / [i915#2119]) -> [SKIP][138] ([fdo#109271]) +2 similar issues
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-snb1/igt@perf_pmu@rc6-runtime-pm-long.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-snb6/igt@perf_pmu@rc6-runtime-pm-long.html
>
>   * igt@runner@aborted:
>     - shard-iclb:         ([FAIL][139], [FAIL][140]) ([i915#2102] / [i915#2110]) -> [FAIL][141] ([i915#2110])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb8/igt@runner@aborted.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb1/igt@runner@aborted.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-iclb7/igt@runner@aborted.html
>     - shard-apl:          ([FAIL][142], [FAIL][143]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][144] ([i915#1635] / [i915#2110])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl1/igt@runner@aborted.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl3/igt@runner@aborted.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/shard-apl4/igt@runner@aborted.html
>
>   
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
>   [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
>   [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
>   [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
>   [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
>   [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
>   [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
>   [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
>   [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
>   [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
>   [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
>   [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
>   [i915#2102]: https://gitlab.freedesktop.org/drm/intel/issues/2102
>   [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
>   [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
>   [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
>   [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
>   [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
>   [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
>   [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
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
>   * IGT: IGT_5721 -> IGTPW_4733
>   * Piglit: piglit_4509 -> None
>
>   CI-20190529: 20190529
>   CI_DRM_8706: 7839b66a1c775fce16da3297056ccee2e81bc4c0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4733: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/index.html
>   IGT_5721: df9004c501b203c1b418781ad2c94dfe36892ef5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4733/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
