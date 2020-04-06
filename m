Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306CA6E02B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 08:18:33 +0000 (UTC)
Date: Mon, 6 Apr 2020 11:18:22 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200406081822.GA29716@ideak-desk.fi.intel.com>
References: <20200402122943.6583-1-imre.deak@intel.com>
 <158599938956.1394.10393703975118945857@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158599938956.1394.10393703975118945857@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Skip_detiler_fences_subtest_on_platforms_w/o_aper?=
 =?utf-8?q?ture_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Jose Souza <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Apr 04, 2020 at 11:23:09AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_flip: Skip detiler fences subtest on platforms w/o aperture (rev3)
> URL   : https://patchwork.freedesktop.org/series/75416/
> State : success

Thanks for the review pushed.

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8252_full -> IGTPW_4405_full
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/index.html
> 
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_8252_full and IGTPW_4405_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@prime_busy@after-wait:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_busy@before:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@prime_busy@hang-wait:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4405_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s3:
>     - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +5 similar issues
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
>     - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#54] / [i915#95])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
>     - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
>     - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#52] / [i915#54]) +3 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
>     - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#177] / [i915#52] / [i915#54])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
>     - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
>     - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54] / [i915#95])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#79])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk8/igt@kms_flip@flip-vs-expired-vblank.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip_tiling@flip-changes-tiling:
>     - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#95])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling.html
>     - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#699] / [i915#93] / [i915#95])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
>     - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#49])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>     - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#49])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
>     - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#49])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
>     - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +1 similar issue
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
> 
>   * igt@kms_psr@no_drrs:
>     - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#173])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-iclb4/igt@kms_psr@no_drrs.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-iclb1/igt@kms_psr@no_drrs.html
> 
>   * igt@kms_psr@psr2_cursor_mmap_cpu:
>     - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +4 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
> 
>   * igt@kms_vblank@pipe-b-query-forked-busy:
>     - shard-snb:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +2 similar issues
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-snb6/igt@kms_vblank@pipe-b-query-forked-busy.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-snb1/igt@kms_vblank@pipe-b-query-forked-busy.html
> 
>   
> #### Possible fixes ####
> 
>   * {igt@gem_ctx_isolation@preservation-s3@bcs0}:
>     - shard-kbl:          [DMESG-WARN][35] ([i915#180]) -> [PASS][36] +4 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>   * igt@gem_exec_balancer@smoke:
>     - shard-iclb:         [SKIP][37] ([fdo#110854]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-iclb5/igt@gem_exec_balancer@smoke.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-iclb2/igt@gem_exec_balancer@smoke.html
> 
>   * igt@gem_exec_suspend@basic-s0:
>     - shard-tglb:         [INCOMPLETE][39] ([i915#456]) -> [PASS][40]
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-tglb8/igt@gem_exec_suspend@basic-s0.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-tglb5/igt@gem_exec_suspend@basic-s0.html
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
>     - shard-kbl:          [FAIL][41] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
> 
>   * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
>     - shard-hsw:          [INCOMPLETE][43] ([i915#61]) -> [PASS][44] +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
> 
>   * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
>     - shard-kbl:          [FAIL][45] ([i915#54]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
>     - shard-apl:          [FAIL][47] ([i915#54]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
>     - shard-kbl:          [FAIL][49] ([i915#93] / [i915#95]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
> 
>   * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled:
>     - shard-glk:          [FAIL][51] ([i915#52] / [i915#54]) -> [PASS][52] +3 similar issues
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled.html
> 
>   * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
>     - shard-apl:          [FAIL][53] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
>     - shard-kbl:          [FAIL][55] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-apl:          [FAIL][57] ([i915#1525] / [i915#95]) -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
>     - shard-kbl:          [FAIL][59] ([i915#64] / [i915#93] / [i915#95]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>     - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-apl:          [FAIL][65] ([i915#1188]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl2/igt@kms_hdr@bpc-switch-dpms.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl7/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
>     - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +1 similar issue
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
> 
>   * igt@kms_plane_lowres@pipe-a-tiling-x:
>     - shard-glk:          [FAIL][69] ([i915#899]) -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
> 
>   * igt@kms_psr@psr2_cursor_render:
>     - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
> 
>   * igt@kms_setmode@basic:
>     - shard-kbl:          [FAIL][73] ([i915#31]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl4/igt@kms_setmode@basic.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl1/igt@kms_setmode@basic.html
> 
>   * {igt@perf@polling-parameterized}:
>     - shard-iclb:         [FAIL][75] ([i915#1542]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-iclb5/igt@perf@polling-parameterized.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-iclb1/igt@perf@polling-parameterized.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_pm_rpm@modeset-pc8-residency-stress:
>     - shard-tglb:         [SKIP][77] ([fdo#109506]) -> [SKIP][78] ([i915#1316] / [i915#579])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>     - shard-iclb:         [SKIP][79] ([fdo#109293] / [fdo#109506]) -> [SKIP][80] ([i915#1316] / [i915#579])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-iclb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
> 
>   * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
>     - shard-apl:          [FAIL][81] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][82] ([fdo#108145] / [i915#265])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
>     - shard-kbl:          [FAIL][83] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][84] ([fdo#108145] / [i915#265])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8252/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
>   [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
>   [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
>   [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
>   [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
>   [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
>   [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
>   [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
>   [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
>   [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
>   [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
>   [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
>   [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
>   [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
>   [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
>   [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
>   [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
>   [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
>   [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
>   [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
>   [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
>   [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
>   [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
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
>   * IGT: IGT_5563 -> IGTPW_4405
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_8252: 3690abb8ed49d9a066f80de39e4e75792c86ac76 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_4405: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/index.html
>   IGT_5563: 7ab7807727262b7ed7e12197b78e867287a17ef6 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4405/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
