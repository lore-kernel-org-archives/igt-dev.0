Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1721196045222767959=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Date: Wed, 01 Jun 2022 02:32:52 -0000
Message-ID: <165405077230.17296.14548942653139524699@emeril.freedesktop.org>
References: <20220531220313.9537-1-quic_jesszhan@quicinc.com>
In-Reply-To: <20220531220313.9537-1-quic_jesszhan@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpipe=5Fcrc=5Fbasic=3A_Support_custom_CRC_sources?=
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

--===============1721196045222767959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_pipe_crc_basic: Support custom CRC sources
URL   : https://patchwork.freedesktop.org/series/104572/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11714_full -> IGTPW_7204_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7204_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7204_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7204_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb6/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb1/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@fbdev@read:
    - {shard-dg1}:        [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-dg1-15/igt@fbdev@read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-dg1-13/igt@fbdev@read.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - {shard-rkl}:        NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1:
    - {shard-rkl}:        NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11714_full and IGTPW_7204_full:

### New IGT tests (5) ###

  * igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-3-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [6.12] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  

Known issues
------------

  Here are the changes found in IGTPW_7204_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#3555] / [i915#5325])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-snb4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#4525]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#2842]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][16] ([i915#2842]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-kbl:          NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-wb-prw-default:
    - shard-snb:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-snb5/igt@gem_exec_flush@basic-wb-prw-default.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-snb6/igt@gem_exec_flush@basic-wb-prw-default.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl7/igt@gem_lmem_swapping@heavy-multi.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#4613])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb1/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-kbl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#4613])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl3/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4613])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb7/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#4270]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb3/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#4270])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][27] ([i915#4991])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl1/igt@gem_userptr_blits@input-checking.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][28] ([fdo#109271]) +123 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-snb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#2527] / [i915#2856])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#2856])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#454])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl8/igt@i915_pm_dc@dc9-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109293] / [fdo#109506])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109506] / [i915#2411])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#110892])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111644] / [i915#1397] / [i915#2411])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#5591])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb2/igt@i915_selftest@live@hangcheck.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#5286]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#5286])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111615])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#2705])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278]) +22 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [i915#3886]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#6095]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl8/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615] / [i915#3689]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3689] / [i915#3886]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3689]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-snb4/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl2/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@legacy:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#1063])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-random:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3359]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-max-size-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3319]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [fdo#109279])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-sliding:
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271]) +74 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk1/igt@kms_cursor_crc@pipe-d-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109279] / [i915#3359]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109274] / [fdo#109278])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109274])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@kms_display_modes@extended-mode-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#5287])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][72] -> [FAIL][73] ([i915#4767])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109274] / [fdo#111825]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][75] -> [DMESG-WARN][76] ([i915#180]) +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#2587])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +12 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271]) +125 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109280] / [fdo#111825]) +13 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][81] -> [SKIP][82] ([i915#433])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#3555])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@kms_hdr@bpc-switch-dpms@pipe-a-edp-1.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][84] ([i915#6079]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][85] ([i915#265])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][86] ([i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#3536]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#5288])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb7/igt@kms_plane_lowres@pipe-b-tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#5176]) +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-dp-1:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271]) +59 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-dp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#5176]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb5/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-c-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109642] / [fdo#111068] / [i915#658])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-kbl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl4/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#1911]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109441])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb3/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#5289])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#3555])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb4/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][100] -> [DMESG-WARN][101] ([i915#180])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][102] -> [FAIL][103] ([i915#43])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-glk2/igt@kms_vblank@pipe-c-accuracy-idle.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk5/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@nouveau_crc@pipe-d-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#2530])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@nouveau_crc@pipe-d-source-rg.html

  * igt@perf@gen12-mi-rpc:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109289]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb4/igt@perf@gen12-mi-rpc.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109291])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@prime_nv_api@i915_self_import.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109291]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb6/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109295] / [fdo#111656])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@sema-50:
    - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2994])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl4/igt@sysfs_clients@sema-50.html
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2994])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#2994])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk7/igt@sysfs_clients@sema-50.html
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#2994])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@sysfs_clients@sema-50.html
    - shard-kbl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2994])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl1/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - {shard-rkl}:        [SKIP][114] ([i915#2582]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-2/igt@fbdev@write.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@fbdev@write.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][116] ([i915#5784]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb2/igt@gem_eio@kms.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][118] ([i915#4525]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [FAIL][120] ([i915#2842]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][122] ([i915#2842]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][124] ([i915#2842]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [SKIP][126] ([fdo#109271]) -> [PASS][127] +3 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][130] ([i915#5566] / [i915#716]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl1/igt@gen9_exec_parse@allowed-single.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc5-psr:
    - {shard-rkl}:        [SKIP][132] ([i915#658]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-2/igt@i915_pm_dc@dc5-psr.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-rkl}:        [FAIL][134] ([i915#3989]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][136] ([i915#4281]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - {shard-rkl}:        [SKIP][138] ([fdo#109308]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-5/igt@i915_pm_rpm@drm-resources-equal.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rps@waitboost:
    - {shard-rkl}:        [FAIL][140] ([i915#4016]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-1/igt@i915_pm_rps@waitboost.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-1/igt@i915_pm_rps@waitboost.html

  * igt@kms_color@pipe-b-degamma:
    - {shard-rkl}:        [SKIP][142] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][143] +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-5/igt@kms_color@pipe-b-degamma.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement:
    - {shard-rkl}:        [SKIP][144] ([fdo#112022] / [i915#4070]) -> [PASS][145] +3 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-2/igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][146] ([i915#180]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - {shard-dg1}:        [FAIL][148] -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-dg1-18/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-dg1-15/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - {shard-rkl}:        [SKIP][150] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][151] +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-5/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - {shard-rkl}:        [SKIP][152] ([fdo#111825] / [i915#4070]) -> [PASS][153] +3 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][154] ([i915#2346] / [i915#533]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [FAIL][156] ([i915#2346]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - {shard-rkl}:        [SKIP][158] ([i915#4070]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-2/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - {shard-rkl}:        [SKIP][160] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][161] +4 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][162] ([i915#4767]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][164] ([i915#79]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-tglb:         [DMESG-WARN][166] ([i915#2411] / [i915#2867]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb5/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][168] ([i915#1849] / [i915#4098]) -> [PASS][169] +19 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - {shard-rkl}:        [SKIP][170] ([i915#4070] / [i915#4098]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - {shard-dg1}:        [FAIL][172] ([i915#5450]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-dg1-18/igt@kms_plane_lowres@pipe-d-tiling-x.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-dg1-13/igt@kms_plane_lowres@pipe-d-tiling-x.html

  * igt@kms_properties@crtc-properties-atomic:
    - {shard-rkl}:        [SKIP][174] ([i915#1849]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-5/igt@kms_properties@crtc-properties-atomic.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr@dpms:
    - {shard-rkl}:        [SKIP][176] ([i915#1072]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-2/igt@kms_psr@dpms.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_psr@dpms.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][178] ([fdo#109441]) -> [PASS][179] +1 similar issue
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [SKIP][180] ([i915#5519]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - {shard-rkl}:        [SKIP][182] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@kms_vblank@pipe-b-query-forked:
    - {shard-rkl}:        [SKIP][184] ([i915#1845] / [i915#4098]) -> [PASS][185] +12 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-rkl-2/igt@kms_vblank@pipe-b-query-forked.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_vblank@pipe-b-query-forked.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - {shard-dg1}:        [FAIL][186] ([i915#4349]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-dg1-18/igt@perf_pmu@busy-double-start@rcs0.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-dg1-13/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - {shard-dg1}:        [FAIL][188] ([i915#1755]) -> [PASS][189] +3 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-dg1-18/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-apl:          [FAIL][190] ([i915#1755]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl8/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl3/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][192] ([i915#3063]) -> [FAIL][193] ([i915#5784])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][194] ([i915#2842]) -> [FAIL][195] ([i915#2852])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][196] ([i915#1319]) -> [FAIL][197] ([fdo#110321] / [fdo#110336])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl4/igt@kms_content_protection@legacy.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei_interface:
    - shard-tglb:         [SKIP][198] ([i915#1063]) -> [SKIP][199] ([fdo#109300])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-tglb3/igt@kms_content_protection@mei_interface.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_content_protection@mei_interface.html
    - shard-iclb:         [SKIP][200] ([fdo#109300] / [fdo#111066]) -> [SKIP][201] ([fdo#109300])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb8/igt@kms_content_protection@mei_interface.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb5/igt@kms_content_protection@mei_interface.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][202] ([i915#2920]) -> [SKIP][203] ([fdo#111068] / [i915#658]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][204] ([fdo#111068] / [i915#658]) -> [SKIP][205] ([i915#2920])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][206] ([i915#2920]) -> [SKIP][207] ([i915#658])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl2/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl1/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl6/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl3/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl7/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl6/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl6/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3371]: https://gitlab.freedesktop.org/drm/intel/issues/3371
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5450]: https://gitlab.freedesktop.org/drm/intel/issues/5450
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6076]: https://gitlab.freedesktop.org/drm/intel/issues/6076
  [i915#6079]: https://gitlab.freedesktop.org/drm/intel/issues/6079
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6501 -> IGTPW_7204
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11714: 3c1a309aaf15b295c91502ec0f2fa92412c33715 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7204: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/index.html
  IGT_6501: 5857938d4d3539deb43ecb03604b7c664b75e57d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/index.html

--===============1721196045222767959==
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
<tr><td><b>Series:</b></td><td>tests/kms_pipe_crc_basic: Support custom CRC=
 sources</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104572/">https://patchwork.freedesktop.org/series/104572/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7204/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11714_full -&gt; IGTPW_7204_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7204_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7204_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7204=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb6/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/=
shard-iclb1/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-dg1-15/igt@fbdev@read.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-dg1-13/igt@fbdev@r=
ead.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interr=
uptible@b-edp1.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> +1 similar issu=
e</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11714_full and IGTPW_7204_=
full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@hdmi-a-3-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7204_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325"=
>i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-snb4/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7204/shard-iclb5/igt@gem_exec_balancer@parallel-keep-submit-fence.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525"=
>i915#4525</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-=
tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/sha=
rd-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-prw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-snb5/igt@gem_exec_flush@basic-wb-prw-default.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/s=
hard-snb6/igt@gem_exec_flush@basic-wb-prw-default.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-apl7/igt@gem_lmem_swapping@heavy-multi.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb1/igt@gem_lmem_swapping@heavy-multi.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613"=
>i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-kbl3/igt@gem_lmem_swapping@heavy-verify-rand=
om.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-glk1/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb7/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb3/igt@gem_pxp@dmabuf-shared-protected-dst=
-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-tglb6/igt@gem_pxp@dmabuf-shared-protected-dst=
-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-apl1/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-snb6/igt@gen9_exec_parse@basic-rejected-ctx-p=
aram.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +123 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx-=
param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856"=
>i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-iclb3/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-apl8/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl1/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D110892">fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress=
-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-tglb2/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-t=
glb3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb8/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_big_joiner@2x-modeset.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i9=
15#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-glk1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-kbl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-apl8/igt@kms_ccs@pipe-b-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_ccs@pipe-b-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_ccs@pipe-d-missing-ccs-buffer-=
y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-snb4/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disa=
ble-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-glk8/igt@kms_chamelium@vga-hpd.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827=
">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_color_chamelium@pipe-a-ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-apl2/igt@kms_color_chamelium@pipe-d-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@kms_content_protection@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063=
">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-max-s=
ize-random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-onscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3319">i915#3319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-sliding:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-glk1/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb8/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-tglb6/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mm=
ap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl1/=
igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_flip@2x-flip-vs-blocking-wf-vb=
lank.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111825">fdo#111825</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7204/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +125 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +13 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-t=
glb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@kms_hdr@bpc-switch-dpms@pipe-a-edp=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-glk3/igt@kms_hdr@bpc-switch-suspend@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/6079">i915#6079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb7/igt@kms_plane_lowres@pipe-b-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-ed=
p-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-dp=
-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-kbl4/igt@kms_plane_scaling@plane-downscale-w=
ith-rotation-factor-0-5@pipe-c-dp-1.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +59 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-c-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb5/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-20x20@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-apl6/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-glk2/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb6/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10964=
2">fdo#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-kbl4/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-tglb3/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911=
">i915#1911</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb3/igt@kms_psr@psr2_no_drrs.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb4/igt@kms_setmode@invalid-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7204/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-glk2/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard=
-glk5/igt@kms_vblank@pipe-c-accuracy-idle.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb5/igt@nouveau_crc@pipe-d-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb4/igt@perf@gen12-mi-rpc.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10928=
9</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb2/igt@prime_nv_api@i915_self_import.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb6/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-tglb1/igt@prime_vgem@coherency-gtt.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fd=
o#109295</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1656">fdo#111656</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-apl4/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-tglb1/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-glk7/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-iclb2/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7204/shard-kbl1/igt@sysfs_clients@sema-50.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-2/igt@fbdev@write.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@fb=
dev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-tglb2/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-tglb6/igt@ge=
m_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7204/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
204/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
204/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
04/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7204/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-wb=
.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7204/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-apl1/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7204/shard-apl7/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-2/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/i=
gt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-5/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rk=
l-4/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-ic=
lb7/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-5/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#10=
9308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
204/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-1/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rk=
l-1/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-5/igt@kms_color@pipe-b-degamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#184=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i9=
15#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/40=
98">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7204/shard-rkl-6/igt@kms_color@pipe-b-degamma.html">PASS</a> +2 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-movement:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-2/igt@kms_cursor_crc@pipe-a-cursor-256x256-rapid-mo=
vement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D112022">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-=
256x256-rapid-movement.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7204/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-dg1-18/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.=
html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7204/shard-dg1-15/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-5/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-ed=
ge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-1=
28x128-bottom-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825=
">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7204/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-glk7/igt@kms_cursor_legacy@flip=
-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346"=
>i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7204/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-torture-bo:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-2/igt@kms_cursor_legacy@pipe-c-torture-bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i91=
5#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7204/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-torture-bo.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-yt=
iled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_draw_crc@draw-method-=
xrgb8888-mmap-cpu-ytiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard=
-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7204/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdm=
i-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-tglb5/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i=
915#2411</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
867">i915#2867</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7204/shard-tglb1/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_frontbuffer_tr=
acking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +19 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/40=
70">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-7e=
fc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-x:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-dg1-18/igt@kms_plane_lowres@pipe-d-tiling-x.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5450">i915#=
5450</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
204/shard-dg1-13/igt@kms_plane_lowres@pipe-d-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-5/igt@kms_properties@crtc-properties-atomic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i=
915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7204/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-2/igt@kms_psr@dpms.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@k=
ms_psr@dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb8/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
04/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7204/shard-iclb4/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-1/igt@kms_universal_plane@universal-plane-gen9-feat=
ures-pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-rkl-6/igt@kms_universal_plane@=
universal-plane-gen9-features-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-rkl-2/igt@kms_vblank@pipe-b-query-forked.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#184=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i9=
15#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7204/shard-rkl-6/igt@kms_vblank@pipe-b-query-forked.html">PASS</a> +12 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-dg1-18/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
04/shard-dg1-13/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>
<p>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11714/shard-dg1-18/igt@sysfs_timeslice_duration@timeout@vecs0.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">=
i915#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7204/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS=
</a> +3 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11714/shard-apl8/igt@sysfs_timeslice_duration@timeout@vecs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">i9=
15#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7204/shard-apl3/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a>=
</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shar=
d-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7204/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915#2852</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-apl4/igt@kms_content_protection@legacy.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#13=
19</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_720=
4/shard-apl2/igt@kms_content_protection@legacy.html">FAIL</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D110321">fdo#110321</a> / <a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110336">fdo#110336</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11714/shard-tglb3/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i91=
5#1063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7204/shard-tglb2/igt@kms_content_protection@mei_interface.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10930=
0</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11714/shard-iclb8/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fd=
o#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1066">fdo#111066</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7204/shard-iclb5/igt@kms_content_protection@mei_interface.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300"=
>fdo#109300</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915=
#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7204/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7204/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11714/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7204/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-d=
mg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11714/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11714/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11714/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl7/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_72=
04/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7204/shard-apl6/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/shar=
d-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6501 -&gt; IGTPW_7204</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11714: 3c1a309aaf15b295c91502ec0f2fa92412c33715 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7204: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7204/index.htm=
l<br />
  IGT_6501: 5857938d4d3539deb43ecb03604b7c664b75e57d @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1721196045222767959==--
