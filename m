Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7078667616977656834=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Fri, 06 Jan 2023 12:22:10 -0000
Message-ID: <167300773052.25042.14151806999088770686@emeril.freedesktop.org>
References: <20230106024812.102077-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230106024812.102077-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/4=5D_lib/amdgpu=3A_rename_function_paramete?=
 =?utf-8?q?r?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============7078667616977656834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/4] lib/amdgpu: rename function parameter
URL   : https://patchwork.freedesktop.org/series/112465/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12550_full -> IGTPW_8307_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Known issues
------------

  Here are the changes found in IGTPW_8307_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#2842]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-apl:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl7/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-apl:          [PASS][4] -> [INCOMPLETE][5] ([i915#7708])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#3323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#5566] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-glk7/igt@gen9_exec_parse@allowed-single.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-apl:          NOTRUN -> [FAIL][9] ([i915#7036])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#3886]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl1/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271]) +76 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][14] ([i915#4573]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#4573])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl6/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl1/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#658]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_vblank@pipe-c-query-busy-hang:
    - shard-snb:          NOTRUN -> [SKIP][18] ([fdo#109271]) +38 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb4/igt@kms_vblank@pipe-c-query-busy-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#533])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@runner@aborted:
    - shard-glk:          NOTRUN -> [FAIL][20] ([i915#4312])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-glk7/igt@runner@aborted.html

  * igt@sysfs_clients@sema-50:
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#2994]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl2/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@core_auth@many-magics:
    - {shard-rkl}:        [SKIP][22] ([i915#2575]) -> [PASS][23] +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@core_auth@many-magics.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@core_auth@many-magics.html

  * igt@device_reset@unbind-reset-rebind:
    - {shard-rkl}:        [FAIL][24] ([i915#4778]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][26] ([i915#7742]) -> [PASS][27] +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html

  * igt@feature_discovery@psr2:
    - {shard-rkl}:        [SKIP][28] ([i915#658]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@feature_discovery@psr2.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@feature_discovery@psr2.html

  * igt@gem_caching@read-writes:
    - shard-apl:          [INCOMPLETE][30] ([i915#7708]) -> [PASS][31] +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl2/igt@gem_caching@read-writes.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl7/igt@gem_caching@read-writes.html

  * igt@gem_create@hog-create@smem0:
    - {shard-rkl}:        [FAIL][32] ([i915#7679]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@gem_create@hog-create@smem0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_create@hog-create@smem0.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][34] ([i915#5784]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-14/igt@gem_eio@reset-stress.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_eio@suspend:
    - {shard-rkl}:        [FAIL][36] ([i915#7052]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@gem_eio@suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-1/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@hog:
    - {shard-rkl}:        [SKIP][38] ([fdo#109315]) -> [PASS][39] +7 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@gem_exec_balancer@hog.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-3/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][40] ([i915#2842]) -> [PASS][41] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-rkl}:        [FAIL][42] ([i915#2842]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - {shard-rkl}:        [SKIP][44] ([i915#3281]) -> [PASS][45] +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_mmap_gtt@coherency:
    - {shard-rkl}:        [SKIP][46] ([fdo#111656]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@gem_mmap_gtt@coherency.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_partial_pwrite_pread@reads:
    - {shard-rkl}:        [SKIP][48] ([i915#3282]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@gem_partial_pwrite_pread@reads.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [DMESG-WARN][50] ([i915#4528]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-snb5/igt@i915_module_load@reload-no-display.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb5/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-dg1}:        [FAIL][52] ([i915#3591]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - {shard-dg1}:        [SKIP][54] ([i915#1397]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-16/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - {shard-rkl}:        [SKIP][56] ([i915#1397]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_suspend@basic-s3-without-i915:
    - {shard-rkl}:        [INCOMPLETE][58] ([i915#4817]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
    - shard-snb:          [INCOMPLETE][60] ([i915#4528] / [i915#4817]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-snb5/igt@i915_suspend@basic-s3-without-i915.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@linear-addfb:
    - {shard-dg1}:        [DMESG-WARN][62] -> [PASS][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-17/igt@kms_big_fb@linear-addfb.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-14/igt@kms_big_fb@linear-addfb.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - {shard-tglu}:       [SKIP][64] ([i915#7651]) -> [PASS][65] +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-tglu-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-tglu-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - {shard-tglu}:       [SKIP][66] ([i915#1845] / [i915#7651]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-tglu-6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-tglu-1/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [FAIL][68] ([i915#79]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - {shard-rkl}:        [SKIP][70] ([i915#1849] / [i915#4098]) -> [PASS][71] +9 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - {shard-tglu}:       [SKIP][72] ([i915#1849]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_properties@plane-properties-atomic:
    - {shard-rkl}:        [SKIP][74] ([i915#1849]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - {shard-rkl}:        [SKIP][76] ([i915#5461]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_universal_plane@universal-plane-pipe-b-sanity:
    - {shard-rkl}:        [SKIP][78] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - {shard-rkl}:        [SKIP][80] ([i915#1845] / [i915#4098]) -> [PASS][81] +15 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_vblank@pipe-b-accuracy-idle.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@perf@invalid-oa-exponent:
    - {shard-rkl}:        [SKIP][82] ([i915#5608]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@perf@invalid-oa-exponent.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-1/igt@perf@invalid-oa-exponent.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-rkl}:        [FAIL][84] ([i915#4349]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@perf_pmu@idle@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-2/igt@perf_pmu@idle@rcs0.html

  * igt@perf_pmu@module-unload:
    - {shard-dg1}:        [DMESG-WARN][86] ([i915#4391]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-17/igt@perf_pmu@module-unload.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-16/igt@perf_pmu@module-unload.html

  * igt@sysfs_timeslice_duration@timeout@rcs0:
    - {shard-dg1}:        [FAIL][88] ([i915#1755]) -> [PASS][89] +5 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-15/igt@sysfs_timeslice_duration@timeout@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-14/igt@sysfs_timeslice_duration@timeout@rcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4778]: https://gitlab.freedesktop.org/drm/intel/issues/4778
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7678]: https://gitlab.freedesktop.org/drm/intel/issues/7678
  [i915#7679]: https://gitlab.freedesktop.org/drm/intel/issues/7679
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7708]: https://gitlab.freedesktop.org/drm/intel/issues/7708
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7110 -> IGTPW_8307
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12550: f604441f326ba242fc0b0f86dc2468863d204c97 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8307: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/index.html
  IGT_7110: db10a19b94d1d7ae5ba62eb48d52c47ccb27766f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/index.html

--===============7078667616977656834==
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
<tr><td><b>Series:</b></td><td>series starting with [1/4] lib/amdgpu: rename function parameter</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112465/">https://patchwork.freedesktop.org/series/112465/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12550_full -&gt; IGTPW_8307_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/index.html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8307_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-glk6/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl7/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-glk7/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-glk7/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7036">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +76 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl6/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl1/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb4/igt@kms_vblank@pipe-c-query-busy-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-glk7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl2/igt@sysfs_clients@sema-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@many-magics:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@core_auth@many-magics.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@core_auth@many-magics.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@device_reset@unbind-reset-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4778">i915#4778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-1/igt@drm_fdinfo@virtual-idle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl2/igt@gem_caching@read-writes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl7/igt@gem_caching@read-writes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@hog-create@smem0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@gem_create@hog-create@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7679">i915#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_create@hog-create@smem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-14/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-16/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@gem_eio@suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7052">i915#7052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-1/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@gem_exec_balancer@hog.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-3/igt@gem_exec_balancer@hog.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-1/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-snb5/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb5/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-16/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-snb5/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-snb7/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-addfb:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-17/igt@kms_big_fb@linear-addfb.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-14/igt@kms_big_fb@linear-addfb.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-tglu-6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-tglu-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-tglu-6/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-tglu-1/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-badstride.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_properties@plane-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_properties@plane-properties-atomic.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-sanity:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-2/igt@kms_vblank@pipe-b-accuracy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-6/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-5/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-1/igt@perf@invalid-oa-exponent.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-rkl-4/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-rkl-2/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-17/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-16/igt@perf_pmu@module-unload.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12550/shard-dg1-15/igt@sysfs_timeslice_duration@timeout@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/shard-dg1-14/igt@sysfs_timeslice_duration@timeout@rcs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7110 -&gt; IGTPW_8307</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12550: f604441f326ba242fc0b0f86dc2468863d204c97 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8307: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8307/index.html<br />
  IGT_7110: db10a19b94d1d7ae5ba62eb48d52c47ccb27766f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============7078667616977656834==--
