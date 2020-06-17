Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15FF6E0D8
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2020 13:53:33 +0000 (UTC)
Date: Wed, 17 Jun 2020 16:52:12 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200617135212.i44aelqxbtt3yxx6@ahiler-desk1.fi.intel.com>
References: <20200616141450.1181127-1-arkadiusz.hiler@intel.com>
 <159233194445.4598.9246744281768038907@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159233194445.4598.9246744281768038907@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/core=3A_Print_thred=3Atid_?=
 =?utf-8?q?with_igt=5Flog_for_non-main_threads?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 06:25:44PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/3] lib/core: Print thred:tid with igt_log for non-main threads
> URL   : https://patchwork.freedesktop.org/series/78422/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_8634_full -> IGTPW_4677_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_4677_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4677_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/index.html
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_4677_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@kms:
>     - shard-hsw:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw2/igt@gem_eio@kms.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw6/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_balancer@bonded-early:
>     - shard-tglb:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb7/igt@gem_exec_balancer@bonded-early.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb1/igt@gem_exec_balancer@bonded-early.html
> 
>   * igt@gem_mmap_offset@clear:
>     - shard-iclb:         [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb6/igt@gem_mmap_offset@clear.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb1/igt@gem_mmap_offset@clear.html
> 
>   * igt@i915_pm_rpm@system-suspend-devices:
>     - shard-iclb:         [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb3/igt@i915_pm_rpm@system-suspend-devices.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
> 
>   * igt@perf@i915-ref-count:
>     - shard-hsw:          [PASS][9] -> [INCOMPLETE][10] +1 similar issue
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-hsw5/igt@perf@i915-ref-count.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-hsw1/igt@perf@i915-ref-count.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_4677_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_ctx_isolation@preservation-s3@rcs0:
>     - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#794])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>     - shard-iclb:         [PASS][13] -> [FAIL][14] ([fdo#103375]) +3 similar issues
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#1930])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@i915_module_load@reload:
>     - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#402]) +6 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb6/igt@i915_module_load@reload.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb2/igt@i915_module_load@reload.html
> 
>   * igt@i915_pm_dc@dc3co-vpb-simulation:
>     - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1904])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@i915_pm_dc@dc5-psr:
>     - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#1899])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
>     - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#1899])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb3/igt@i915_pm_dc@dc5-psr.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb6/igt@i915_pm_dc@dc5-psr.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#1568])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb3/igt@i915_pm_rc6_residency@rc6-idle.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-glk:          [PASS][27] -> [DMESG-FAIL][28] ([i915#118] / [i915#95])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-180:
>     - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl4/igt@kms_big_fb@linear-8bpp-rotate-180.html
> 
>   * igt@kms_color@pipe-b-ctm-max:
>     - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#95]) +42 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl4/igt@kms_color@pipe-b-ctm-max.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl1/igt@kms_color@pipe-b-ctm-max.html
> 
>   * igt@kms_cursor_crc@pipe-d-cursor-suspend:
>     - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#1602])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp1:
>     - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +5 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_plane_cursor@pipe-a-viewport-size-64:
>     - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#95]) +1 similar issue
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
>     - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#95])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
> 
>   * igt@kms_psr2_su@frontbuffer:
>     - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068]) +1 similar issue
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
> 
>   * igt@kms_setmode@basic:
>     - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#31])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl3/igt@kms_setmode@basic.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl1/igt@kms_setmode@basic.html
> 
>   * igt@perf@blocking-parameterized:
>     - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#1542])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-iclb2/igt@perf@blocking-parameterized.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-iclb1/igt@perf@blocking-parameterized.html
> 
>   * igt@syncobj_basic@bad-flags-fd-to-handle:
>     - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#93] / [i915#95]) +50 similar issues
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8634/shard-kbl2/igt@syncobj_basic@bad-flags-fd-to-handle.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4677/shard-kbl7/igt@syncobj_basic@bad-flags-fd-to-handle.html

None of those look like they have been caused by the changes in thread
behavior, even after looking at the code. I'll spin a re-run just to be sure.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
