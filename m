Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8856523843392028131=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Nov 2021 02:46:48 -0000
Message-ID: <163824040829.20413.16752817414272667353@emeril.freedesktop.org>
References: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Improve_amd=5Fcolor?=
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
To: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============8856523843392028131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Improve amd_color
URL   : https://patchwork.freedesktop.org/series/97382/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10938_full -> IGTPW_6448_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html

Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Known issues
------------

  Here are the changes found in IGTPW_6448_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> ([SKIP][1], [SKIP][2]) ([fdo#109271] / [i915#1099]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb7/igt@gem_ctx_persistence@process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb2/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][3] -> ([PASS][4], [TIMEOUT][5]) ([i915#3063] / [i915#3648])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb1/igt@gem_eio@unwedge-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         [PASS][6] -> ([TIMEOUT][7], [PASS][8]) ([i915#2481] / [i915#3070])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb8/igt@gem_eio@unwedge-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [PASS][11] -> ([FAIL][12], [FAIL][13]) ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][14] -> ([PASS][15], [FAIL][16]) ([i915#2842]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][17] -> ([FAIL][18], [FAIL][19]) ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-tglb:         [PASS][20] -> ([FAIL][21], [FAIL][22]) ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#2849])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@submit-early-slice@rcs0:
    - shard-tglb:         [PASS][25] -> ([INCOMPLETE][26], [PASS][27]) ([i915#4660])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb2/igt@gem_exec_schedule@submit-early-slice@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_exec_schedule@submit-early-slice@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gem_exec_schedule@submit-early-slice@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> ([SKIP][28], [SKIP][29]) ([fdo#109271] / [i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_huc_copy@huc-copy.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-kbl:          NOTRUN -> ([SKIP][30], [SKIP][31]) ([fdo#109271] / [i915#4613]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_lmem_swapping@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-apl:          NOTRUN -> ([SKIP][32], [SKIP][33]) ([fdo#109271] / [i915#4613]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@gem_lmem_swapping@heavy-random.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl8/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-glk:          NOTRUN -> ([SKIP][34], [SKIP][35]) ([fdo#109271] / [i915#4613]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk1/igt@gem_lmem_swapping@parallel-random-engines.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk9/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-iclb:         NOTRUN -> ([SKIP][37], [SKIP][38]) ([i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_lmem_swapping@parallel-random-verify.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-tglb:         NOTRUN -> ([SKIP][40], [SKIP][41]) ([i915#4613]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gem_lmem_swapping@random.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb2/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#4613])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> ([WARN][43], [WARN][44]) ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271]) +81 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-iclb:         NOTRUN -> ([SKIP][46], [SKIP][47]) ([i915#4270])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-1.html
    - shard-tglb:         NOTRUN -> ([SKIP][48], [SKIP][49]) ([i915#4270])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#4270])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> ([SKIP][51], [SKIP][52]) ([fdo#109271]) +167 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#768])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> ([SKIP][54], [SKIP][55]) ([i915#768])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@gem_render_copy@y-tiled-to-vebox-linear.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_softpin@allocator-nopin:
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271]) +23 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb5/igt@gem_softpin@allocator-nopin.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-iclb:         NOTRUN -> ([SKIP][57], [SKIP][58]) ([i915#3297])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_userptr_blits@create-destroy-unsync.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> ([SKIP][59], [SKIP][60]) ([fdo#109271] / [i915#3323])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-iclb:         NOTRUN -> ([SKIP][61], [SKIP][62]) ([i915#2856])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gen9_exec_parse@unaligned-access.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@gen9_exec_parse@unaligned-access.html
    - shard-tglb:         NOTRUN -> ([SKIP][63], [SKIP][64]) ([i915#2856])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gen9_exec_parse@unaligned-access.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][65] ([i915#454])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         NOTRUN -> ([WARN][66], [WARN][67]) ([i915#1804] / [i915#2684])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> ([SKIP][68], [SKIP][69]) ([fdo#109293] / [fdo#109506])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109506] / [i915#2411])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#404])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> ([SKIP][72], [SKIP][73]) ([fdo#110725] / [fdo#111614]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> ([SKIP][74], [SKIP][75]) ([fdo#111614])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> ([SKIP][76], [SKIP][77]) ([fdo#109271] / [i915#3777])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> ([SKIP][78], [SKIP][79]) ([fdo#109271] / [i915#3777]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111614])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#110723])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> ([SKIP][82], [SKIP][83]) ([fdo#111615]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> ([SKIP][84], [SKIP][85]) ([i915#2705])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_big_joiner@2x-modeset.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> ([SKIP][86], [SKIP][87]) ([i915#2705])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_big_joiner@2x-modeset.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#3886]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#3886]) +6 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([i915#3689] / [i915#3886]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][92], [SKIP][93]) ([i915#3689]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#3886]) +6 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk9/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> ([SKIP][95], [SKIP][96]) ([fdo#109271] / [i915#3886]) +8 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> ([SKIP][97], [SKIP][98]) ([fdo#109271] / [i915#3886]) +6 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109278] / [i915#3886]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> ([SKIP][100], [SKIP][101]) ([fdo#109278] / [i915#3886]) +5 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> ([SKIP][102], [SKIP][103]) ([fdo#109271] / [i915#3886]) +4 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk5/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][104], [SKIP][105]) ([fdo#111615] / [i915#3689])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271]) +61 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> ([SKIP][107], [SKIP][108]) ([fdo#109284] / [fdo#111827]) +6 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_chamelium@dp-frame-dump.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> ([SKIP][110], [SKIP][111]) ([fdo#109284] / [fdo#111827]) +5 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_chamelium@hdmi-edid-read.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-snb:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([fdo#109271] / [fdo#111827]) +4 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb6/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb4/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109278] / [i915#1149])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([fdo#109271] / [fdo#111827]) +9 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([fdo#109284] / [fdo#111827])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([fdo#109271] / [fdo#111827]) +7 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
    - shard-glk:          NOTRUN -> ([SKIP][121], [SKIP][122]) ([fdo#109271] / [fdo#111827]) +8 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> ([TIMEOUT][124], [TIMEOUT][125]) ([i915#1319])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@kms_content_protection@atomic-dpms.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> ([SKIP][126], [SKIP][127]) ([i915#3116])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglb:         NOTRUN -> ([SKIP][128], [SKIP][129]) ([fdo#111828])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_content_protection@legacy.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> ([TIMEOUT][130], [TIMEOUT][131]) ([i915#1319]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@kms_content_protection@lic.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl3/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [FAIL][132] ([fdo#110321])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-snb:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([fdo#109271]) +84 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> ([SKIP][135], [SKIP][136]) ([i915#3319]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> ([SKIP][137], [SKIP][138]) ([fdo#109278] / [fdo#109279]) +3 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> ([SKIP][139], [SKIP][140]) ([fdo#109279] / [i915#3359]) +2 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> ([SKIP][141], [SKIP][142]) ([i915#3359]) +5 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][143] ([fdo#109278] / [fdo#109279])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][144] -> ([INCOMPLETE][145], [PASS][146]) ([i915#2411] / [i915#456])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][147] ([fdo#109278]) +9 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][148] ([fdo#109274] / [fdo#109278])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-tglb:         NOTRUN -> [SKIP][149] ([fdo#111825])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-iclb:         NOTRUN -> ([SKIP][150], [SKIP][151]) ([fdo#109274] / [fdo#109278])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@pipe-b-single-move

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html

--===============8856523843392028131==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Improve amd_color</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97382/">https://patchwork.freedesktop.org/series/97382/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10938_full -&gt; IGTPW_6448_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/index.html</p>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6448_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb7/igt@gem_ctx_persistence@process.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb2/igt@gem_ctx_persistence@process.html">SKIP</a>) ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb1/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a>) ([i915#3063] / [i915#3648])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb8/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_eio@unwedge-stress.html">PASS</a>) ([i915#2481] / [i915#3070])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>) ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a>) ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>) ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>) ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@submit-early-slice@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb2/igt@gem_exec_schedule@submit-early-slice@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_exec_schedule@submit-early-slice@rcs0.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gem_exec_schedule@submit-early-slice@rcs0.html">PASS</a>) ([i915#4660])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_huc_copy@huc-copy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl6/igt@gem_huc_copy@huc-copy.html">SKIP</a>) ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_lmem_swapping@basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_lmem_swapping@basic.html">SKIP</a>) ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@gem_lmem_swapping@heavy-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl8/igt@gem_lmem_swapping@heavy-random.html">SKIP</a>) ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk1/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a>) ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a>) ([i915#4613])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gem_lmem_swapping@random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb2/igt@gem_lmem_swapping@random.html">SKIP</a>) ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html">WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a>) ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([fdo#109271]) +81 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a>) ([i915#4270])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a>) ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a>) ([fdo#109271]) +167 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a>) ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@allocator-nopin:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb5/igt@gem_softpin@allocator-nopin.html">SKIP</a> ([fdo#109271]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb8/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a>) ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>) ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@gen9_exec_parse@unaligned-access.html">SKIP</a>) ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@gen9_exec_parse@unaligned-access.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@gen9_exec_parse@unaligned-access.html">SKIP</a>) ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>) ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@i915_pm_rpm@pc8-residency.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a>) ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>) ([fdo#110725] / [fdo#111614]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a>) ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_big_joiner@2x-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@kms_big_joiner@2x-modeset.html">SKIP</a>) ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_big_joiner@2x-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_big_joiner@2x-modeset.html">SKIP</a>) ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([i915#3689] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html">SKIP</a>) ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk9/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) ([fdo#109271] / [i915#3886]) +8 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) ([fdo#109271] / [i915#3886]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([fdo#109278] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk1/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk5/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html">SKIP</a>) ([fdo#111615] / [i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@kms_cdclk@mode-transition.html">SKIP</a> ([fdo#109271]) +61 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_chamelium@dp-frame-dump.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html">SKIP</a>) ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a>) ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb6/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb4/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb6/igt@kms_color@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-glk2/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl3/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a>) ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a>) ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb3/igt@kms_content_protection@legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_content_protection@legacy.html">SKIP</a>) ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl4/igt@kms_content_protection@lic.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-apl3/igt@kms_content_protection@lic.html">TIMEOUT</a>) ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-kbl2/igt@kms_content_protection@lic.html">FAIL</a> ([fdo#110321])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-snb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html">SKIP</a>) ([fdo#109271]) +84 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html">SKIP</a>) ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a>) ([fdo#109278] / [fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a>) ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a>) ([i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10938/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a>) ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html">SKIP</a> ([fdo#109278]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-tglb6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6448/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a>) ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-b-single-move</p>
</li>
</ul>

</body>
</html>

--===============8856523843392028131==--
