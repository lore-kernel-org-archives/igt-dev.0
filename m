Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A1710EA9C
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 09:47:28 +0000 (UTC)
Date: Thu, 13 Apr 2023 11:47:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230413094702.b5l63zpwullrjpno@kamilkon-desk1>
References: <20230413012426.503658-1-zack@kde.org>
 <168135152040.3697.2379804853418690155@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <168135152040.3697.2379804853418690155@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogIGZhaWx1cmUgZm9yIEFkZCB2?=
 =?utf-8?q?mwgfx_support_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Laxminarayana Naramasetti <laxminarayanax.naramasetti@intel.com>,
 Sai Nandan Yedireswarapu <saix.nandan.yedireswarapu@intel.com>,
 Raviteja Veesam <ravitejax.veesam@intel.com>, Zack Rusin <zack@kde.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-04-13 at 02:05:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add vmwgfx support (rev4)
> URL   : https://patchwork.freedesktop.org/series/111441/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_12997 -> IGTPW_8795
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_8795 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_8795, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html
> 
> Participating hosts (37 -> 36)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_8795:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-atsm-1:         [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-atsm-1:         [PASS][3] -> [FAIL][4] +38 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@i915_selftest@live@slpc.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@i915_selftest@live@slpc.html
> 

Unrelated to the change, this is vmwgfx, not intel gpu,
please re-run.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_8795 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - bat-rpls-2:         NOTRUN -> [ABORT][5] ([i915#6687])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - bat-atsm-1:         NOTRUN -> [SKIP][6] ([i915#5775]) +3 similar issues
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_sync@basic-each:
>     - bat-atsm-1:         [PASS][7] -> [SKIP][8] ([i915#2575]) +38 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_sync@basic-each.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_sync@basic-each.html
> 
>   * igt@gem_wait@busy:
>     - bat-atsm-1:         NOTRUN -> [SKIP][9] ([i915#2575]) +11 similar issues
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_wait@busy.html
> 
>   * igt@i915_pm_rpm@basic-rte:
>     - bat-atsm-1:         [PASS][10] -> [SKIP][11] ([i915#5174]) +2 similar issues
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@i915_pm_rpm@basic-rte.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@i915_pm_rpm@basic-rte.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][12] ([i915#6367] / [i915#7913] / [i915#7996])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@i915_selftest@live@slpc.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - fi-cfl-8700k:       NOTRUN -> [SKIP][13] ([fdo#109271])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/fi-cfl-8700k/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
>     - bat-dg2-8:          [PASS][14] -> [FAIL][15] ([i915#7932])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
> 
>   * igt@kms_pipe_crc_basic@read-crc:
>     - bat-adlp-9:         NOTRUN -> [SKIP][16] ([i915#3546]) +1 similar issue
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@eof:
>     - bat-atsm-1:         [SKIP][17] ([i915#2582]) -> [PASS][18] +4 similar issues
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@fbdev@eof.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@fbdev@eof.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg2-11:         [FAIL][19] ([i915#8308]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-11/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-rpls-2:         [ABORT][21] ([i915#4983] / [i915#7913]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-rpls-2/igt@i915_selftest@live@reset.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-2/igt@i915_selftest@live@reset.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-rpls-1:         [DMESG-FAIL][23] ([i915#6997]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-rpls-1/igt@i915_selftest@live@slpc.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-rpls-1/igt@i915_selftest@live@slpc.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - fi-cfl-8700k:       [ABORT][25] ([i915#8299]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
>     - bat-dg2-8:          [FAIL][27] ([i915#7932]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_mmap@basic:
>     - bat-atsm-1:         [SKIP][29] ([i915#4083]) -> [SKIP][30] ([i915#2575])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_mmap@basic.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_mmap@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-atsm-1:         [SKIP][31] ([i915#4077]) -> [SKIP][32] ([i915#2575]) +2 similar issues
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-atsm-1:         [SKIP][33] ([i915#4079]) -> [SKIP][34] ([i915#2575]) +1 similar issue
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@gem_tiled_pread_basic.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@gem_tiled_pread_basic.html
> 
>   * igt@kms_addfb_basic@size-max:
>     - bat-atsm-1:         [SKIP][35] ([i915#6077]) -> [SKIP][36] ([i915#2575]) +36 similar issues
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_addfb_basic@size-max.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_addfb_basic@size-max.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>     - bat-atsm-1:         [SKIP][37] ([i915#6078]) -> [SKIP][38] ([i915#2575]) +19 similar issues
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>   * igt@kms_flip@basic-plain-flip:
>     - bat-atsm-1:         [SKIP][39] ([i915#6166]) -> [SKIP][40] ([i915#2575]) +3 similar issues
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_flip@basic-plain-flip.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_flip@basic-plain-flip.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-atsm-1:         [SKIP][41] ([i915#6093]) -> [SKIP][42] ([i915#2575]) +3 similar issues
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - bat-atsm-1:         [SKIP][43] ([i915#1836]) -> [SKIP][44] ([i915#2575]) +6 similar issues
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_pipe_crc_basic@hang-read-crc.html
> 
>   * igt@kms_prop_blob@basic:
>     - bat-atsm-1:         [SKIP][45] ([i915#7357]) -> [SKIP][46] ([i915#2575])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_prop_blob@basic.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_prop_blob@basic.html
> 
>   * igt@kms_psr@sprite_plane_onoff:
>     - bat-atsm-1:         [SKIP][47] ([i915#1072]) -> [SKIP][48] ([i915#2575]) +3 similar issues
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_psr@sprite_plane_onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-atsm-1:         [SKIP][49] ([i915#6094]) -> [SKIP][50] ([i915#2575])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-atsm-1:         [SKIP][51] ([fdo#109295] / [i915#6078]) -> [SKIP][52] ([i915#2575])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-atsm-1:         [SKIP][53] ([fdo#109295] / [i915#4077]) -> [SKIP][54] ([i915#2575]) +1 similar issue
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-atsm-1:         [SKIP][55] ([fdo#109295]) -> [SKIP][56] ([i915#2575]) +3 similar issues
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12997/bat-atsm-1/igt@prime_vgem@basic-write.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/bat-atsm-1/igt@prime_vgem@basic-write.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
>   [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
>   [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
>   [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
>   [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
>   [i915#5775]: https://gitlab.freedesktop.org/drm/intel/issues/5775
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
>   [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
>   [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
>   [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
>   [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
>   [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
>   [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
>   [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
>   [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
>   [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
>   [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
>   [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996
>   [i915#8299]: https://gitlab.freedesktop.org/drm/intel/issues/8299
>   [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7253 -> IGTPW_8795
> 
>   CI-20190529: 20190529
>   CI_DRM_12997: afe31b57e95ebf86f5814fd01a030c2f9551acb4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_8795: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html
>   IGT_7253: 1a619e8dbc6ca887f2ae24b2d7f1ac536342f58c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> Testlist changes
> ----------------
> 
> +++ 210 lines
> --- 2 lines
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8795/index.html
