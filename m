Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5695680161562022263=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 13 Oct 2022 08:10:38 -0000
Message-ID: <166564863885.20378.2039488954131638748@emeril.freedesktop.org>
References: <20221013055804.29076-1-swati2.sharma@intel.com>
In-Reply-To: <20221013055804.29076-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_tests/kms=5Fatomic=3A_Tes?=
 =?utf-8?q?t_cleanup?=
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

--===============5695680161562022263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_atomic: Test cleanup
URL   : https://patchwork.freedesktop.org/series/109648/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12239_full -> IGTPW_7956_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_7956_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7956_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/index.html

Participating hosts (9 -> 6)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7956_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_atomic@atomic-plane-damage} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb6/igt@kms_atomic@atomic-plane-damage.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-iclb:         [SKIP][2] ([i915#404]) -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglb:         [SKIP][4] ([i915#404]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12239_full and IGTPW_7956_full:

### New IGT tests (41) ###

  * igt@kms_atomic@atomic-invalid-params@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_atomic@atomic-invalid-params@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.91, 0.97] s

  * igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_atomic@atomic-invalid-params@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_atomic@atomic-plane-damage:
    - Statuses : 4 skip(s)
    - Exec time: [0.15, 2.50] s

  * igt@kms_atomic@atomic-plane-damage@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.65] s

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_atomic@crtc-invalid-params@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_atomic@crtc-invalid-params@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.47] s

  * igt@kms_atomic@crtc-invalid-params@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_atomic@crtc-invalid-params@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_atomic@plane-cursor-legacy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.62] s

  * igt@kms_atomic@plane-cursor-legacy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.91] s

  * igt@kms_atomic@plane-cursor-legacy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.90] s

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.75] s

  * igt@kms_atomic@plane-immutable-zpos@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_atomic@plane-invalid-params-fence@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.53] s

  * igt@kms_atomic@plane-invalid-params-fence@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_atomic@plane-invalid-params-fence@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_atomic@plane-invalid-params@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_atomic@plane-invalid-params@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.49] s

  * igt@kms_atomic@plane-invalid-params@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_atomic@plane-invalid-params@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_atomic@plane-overlay-legacy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.50] s

  * igt@kms_atomic@plane-overlay-legacy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_atomic@plane-overlay-legacy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_atomic@plane-primary-legacy@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_atomic@plane-primary-legacy@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.55] s

  * igt@kms_atomic@plane-primary-legacy@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_atomic@plane-primary-legacy@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_atomic@test-only@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_atomic@test-only@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 2.64] s

  * igt@kms_atomic@test-only@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_atomic@test-only@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  

Known issues
------------

  Here are the changes found in IGTPW_7956_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#6268])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-snb5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#280])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#4525]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk5/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#4613]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#4613]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb8/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#4613]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl2/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#4270]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#4270]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb1/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#768])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109312])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109312])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb8/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#3323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#3297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#3297])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#3989] / [i915#454])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl8/igt@i915_suspend@debugfs-reader.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl8/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#7017] / [i915#7057])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb5/igt@kms_addfb_basic@legacy-format.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#5286]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#5286]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111614]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3886]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278] / [i915#3886])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:
    - shard-snb:          NOTRUN -> [SKIP][41] ([fdo#109271]) +89 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615] / [i915#3689]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb5/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#6095])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271]) +80 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3689]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_chamelium@dp-hpd.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl2/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-snb6/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@uevent:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#7118])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#6944] / [i915#7118])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][54] ([i915#1339] / [i915#7144])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl1/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#111825])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb5/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#2587] / [i915#2672])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#2672]) +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#2587] / [i915#2672]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#3555])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2672] / [i915#3555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109285])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_force_connector_basic@force-load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109285])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#6497]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +10 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109280] / [fdo#111825]) +10 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#6403]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#6403]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109289])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109289])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [FAIL][72] ([i915#4573]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +91 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl6/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#5176]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#5176]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#6524])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_prime@basic-modeset-hybrid.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#6524])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb2/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2920])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl8/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][82] -> [SKIP][83] ([fdo#109441])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][84] -> [FAIL][85] ([i915#5639])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl7/igt@perf@polling-parameterized.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl7/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][86] ([i915#2846]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][88] ([i915#2842]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          [FAIL][90] ([i915#2842]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][92] ([i915#180] / [i915#1982]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl8/igt@gem_workarounds@suspend-resume-context.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][94] ([fdo#109271]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [DMESG-WARN][96] ([i915#180]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl1/igt@i915_suspend@forcewake.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl8/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-tglb:         [INCOMPLETE][98] ([i915#6987]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-tglb2/igt@kms_addfb_basic@legacy-format.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][100] ([i915#2346]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][102] ([i915#2122]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-glk:          [FAIL][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [SKIP][106] ([i915#5235]) -> [PASS][107] +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][108] ([fdo#109441]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@stress-open-close:
    - shard-glk:          [INCOMPLETE][110] ([i915#5213]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-glk6/igt@perf@stress-open-close.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk1/igt@perf@stress-open-close.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][112] ([i915#658]) -> [SKIP][113] ([i915#588])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][114] ([i915#1319] / [i915#7121]) -> [INCOMPLETE][115] ([i915#1319] / [i915#7121] / [i915#7173])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl7/igt@kms_content_protection@legacy@pipe-a-dp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl1/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][116] ([i915#7121]) -> [INCOMPLETE][117] ([i915#7121] / [i915#7173]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl1/igt@kms_content_protection@srm@pipe-a-dp-1.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl6/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][118] ([i915#2920]) -> [SKIP][119] ([i915#658]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124]) ([fdo#109271] / [i915#180] / [i915#3002]) -> ([FAIL][125], [FAIL][126], [FAIL][127]) ([i915#180] / [i915#3002])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl1/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl8/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl8/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl3/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1339]: https://gitlab.freedesktop.org/drm/intel/issues/1339
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6987]: https://gitlab.freedesktop.org/drm/intel/issues/6987
  [i915#7017]: https://gitlab.freedesktop.org/drm/intel/issues/7017
  [i915#7057]: https://gitlab.freedesktop.org/drm/intel/issues/7057
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7121]: https://gitlab.freedesktop.org/drm/intel/issues/7121
  [i915#7144]: https://gitlab.freedesktop.org/drm/intel/issues/7144
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7012 -> IGTPW_7956
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12239: c8ba40d43d6d1c9e457ebe91543a04a9e85b29f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7956: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/index.html
  IGT_7012: ca6f5bdd537d26692c4b1ca011b8c4f227d95703 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/index.html

--===============5695680161562022263==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/km=
s_atomic: Test cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109648/">https://patchwork.freedesktop.org/series/109648/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7956/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12239_full -&gt; IGTPW_7956_full</=
h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_7956_full need to be verified<br=
 />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7956_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/index.=
html</p>
<h2>Participating hosts (9 -&gt; 6)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7956=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_atomic@atomic-plane-damage} (NEW):<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb6/igt@kms_atomic@atomic-plane-damage.htm=
l">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12239/shard-iclb5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
404">i915#404</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7956/shard-iclb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.=
html">SKIP</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12239/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
404">i915#404</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7956/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.=
html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12239_full and IGTPW_7956_=
full:</p>
<h3>New IGT tests (41)</h3>
<ul>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.91, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.15, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@crtc-invalid-params@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-cursor-legacy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-overlay-legacy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7956_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard=
-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-snb5/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7956/shard-iclb5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12239/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/s=
hard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12239/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/sh=
ard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-glk5/igt@gem_lmem_swapping@heavy-random.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@gem_lmem_swapping@parallel-multi.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb8/igt@gem_lmem_swapping@parallel-random.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-apl2/igt@gem_lmem_swapping@verify-random-ccs=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb5/igt@gem_pxp@protected-encrypted-src-cop=
y-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb1/igt@gem_pxp@protected-encrypted-src-cop=
y-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb7/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb8/igt@gem_softpin@evict-snoop-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109312">fdo#109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb5/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915=
#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl8/igt@i915_suspend@debugfs-reader.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl=
8/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-iclb5/igt@kms_addfb_basic@legacy-format.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-=
iclb3/igt@kms_addfb_basic@legacy-format.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/7017">i915#7017</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/7057">i915#7057</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb2/igt@kms_big_fb@4-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-glk5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-snb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +89 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb5/igt@kms_ccs@pipe-c-ccs-on-another-bo-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a>) +80 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_ccs@pipe-d-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_chamelium@dp-hpd.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827"=
>fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-apl2/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-snb6/igt@kms_chamelium@vga-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7118"=
>i915#7118</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6944"=
>i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/7118">i915#7118</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-apl1/igt@kms_content_protection@uevent@pipe-=
a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1339">i915#1339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/7144">i915#7144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_flip@2x-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb5/igt@kms_flip@2x-flip-vs-panning.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#26=
72</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6497">i915#6497</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +10 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +10 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb7/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-mo=
deset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-mo=
deset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-glk3/igt@kms_plane_alpha_blend@alpha-transpa=
rent-fb@pipe-b-hdmi-a-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-d=
p-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-apl6/igt@kms_plane_scaling@plane-downscale-w=
ith-modifiers-factor-0-5@pipe-a-dp-1.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +91 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-tglb1/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-iclb3/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +4 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb7/igt@kms_prime@basic-modeset-hybrid.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524=
">i915#6524</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb2/igt@kms_prime@basic-modeset-hybrid.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6524=
">i915#6524</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-tglb2/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_psr2_sf@cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7956/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7956/shard-apl8/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard=
-iclb1/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl7/igt@perf@polling-parameterized.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl7=
/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5639">i915#5639</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-glk3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/sh=
ard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
956/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
56/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl8/igt@gem_workarounds@suspend-resume-context.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7956/shard-apl3/igt@gem_workarounds@suspend-resume-context.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl=
2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl1/igt@i915_suspend@forcewake.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shar=
d-apl8/igt@i915_suspend@forcewake.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-tglb2/igt@kms_addfb_basic@legacy-format.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6987">i91=
5#6987</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7956/shard-tglb7/igt@kms_addfb_basic@legacy-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7956/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk7/igt@kms_flip@2x-plain-flip-=
fb-recreate-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-glk8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp=
-linear-downscaling@pipe-a-valid-mode.html">FAIL</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-glk8/igt@kms_flip_scal=
ed_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-iclb1/igt@kms_plane_scalin=
g@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">PASS</a> +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
56/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-glk6/igt@perf@stress-open-close.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/sh=
ard-glk1/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/=
shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl7/igt@kms_content_protection@legacy@pipe-a-dp-1.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1319">i915#1319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/7121">i915#7121</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7956/shard-apl1/igt@kms_content_protection@legacy@pipe-a-=
dp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1319">i915#1319</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/7121">i915#7121</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-apl1/igt@kms_content_protection@srm@pipe-a-dp-1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
121">i915#7121</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7956/shard-apl6/igt@kms_content_protection@srm@pipe-a-dp-1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
121">i915#7121</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/7173">i915#7173</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12239/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7956/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12239/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12239/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12239/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12239/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a>) -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-a=
pl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7956/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/shard-apl6/igt=
@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3002">i915#3002</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7012 -&gt; IGTPW_7956</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12239: c8ba40d43d6d1c9e457ebe91543a04a9e85b29f8 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7956: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7956/index.htm=
l<br />
  IGT_7012: ca6f5bdd537d26692c4b1ca011b8c4f227d95703 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5695680161562022263==--
