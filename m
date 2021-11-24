Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6671820438013767286=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Nov 2021 20:25:27 -0000
Message-ID: <163778552793.25293.9515739173671123282@emeril.freedesktop.org>
References: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdC9h?=
 =?utf-8?q?mdgpu=3A_Add_multi-eDP_support_to_ABM_test?=
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

--===============6671820438013767286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: test/amdgpu: Add multi-eDP support to ABM test
URL   : https://patchwork.freedesktop.org/series/97113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10907_full -> IGTPW_6419_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/index.html

Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Known issues
------------

  Here are the changes found in IGTPW_6419_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][1] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb5/igt@gem_ctx_persistence@process.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#280])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#4525]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_capture@pi@vecs0:
    - shard-iclb:         [PASS][5] -> [INCOMPLETE][6] ([i915#2369] / [i915#3371])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb6/igt@gem_exec_capture@pi@vecs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@gem_exec_capture@pi@vecs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2842]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#109283])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#109283])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#112283])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#4555]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb8/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#284])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][18] ([i915#2658])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-iclb:         NOTRUN -> [WARN][19] ([i915#2658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][20] ([i915#2658])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][21] ([i915#2658])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#4270]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][26] ([i915#3002])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl2/igt@gem_userptr_blits@input-checking.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#2856])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb5/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#2856]) +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#456])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb3/igt@i915_suspend@fence-restore-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111614]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3777])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3777]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3777]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111615]) +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#2705])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3689] / [i915#3886]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3886]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615] / [i915#3689]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#3886]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#3886])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3689]) +9 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3742]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [i915#1149])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl3/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk9/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb8/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3116]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111828])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [PASS][61] -> [INCOMPLETE][62] ([i915#2411] / [i915#2828] / [i915#456])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][63] -> [DMESG-WARN][64] ([i915#180]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3319]) +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109279] / [i915#3359]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3359]) +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#4103])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [PASS][69] -> [FAIL][70] ([i915#2346])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#426])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][72] -> [INCOMPLETE][73] ([i915#2411] / [i915#456])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271]) +64 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl7/igt@kms_flip@2x-flip-vs-panning.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109274]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2587])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2672])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-kbl:          [PASS][78] -> [INCOMPLETE][79] ([i915#4635])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111825]) +48 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-snb:          NOTRUN -> [SKIP][81] ([fdo#109271]) +66 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-iclb:         [PASS][82] -> [DMESG-WARN][83] ([i915#4391])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109280]) +8 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][85] -> [SKIP][86] ([i915#433])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#1187])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_hdr@static-swap.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#1187])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb5/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109289]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#533])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][91] ([fdo#108145] / [i915#265]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278]) +8 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb8/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#3536]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#111615] / [fdo#112054]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2920])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2920]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#658]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#1911])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][102] -> [SKIP][103] ([fdo#109441]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_dpms:
    - shard-tglb:         NOTRUN -> [FAIL][104] ([i915#132] / [i915#3467]) +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][105] -> [FAIL][106] ([i915#31])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-glk6/igt@kms_setmode@basic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-query-forked-busy-hang:
    - shard-kbl:          [PASS][107] -> [INCOMPLETE][108] ([i915#2828])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl2/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_vblank@pipe-b-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-c-wait-forked-hang:
    - shard-kbl:          [PASS][109] -> [INCOMPLETE][110] ([i915#4629])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl6/igt@kms_vblank@pipe-c-wait-forked-hang.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_vblank@pipe-c-wait-forked-hang.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-glk:          NOTRUN -> [SKIP][111] ([fdo#109271]) +43 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk2/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([fdo#109502]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_vrr@flip-basic.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#2530]) +5 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@nouveau_crc@pipe-c-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][114] ([i915#2530])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb6/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109289])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#109291]) +3 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271]) +84 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@prime_nv_pcopy@test2.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#111656])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@fair-7:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#2994])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          [FAIL][120] ([i915#2842]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-iclb:         [FAIL][122] ([i915#2842]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb5/igt@gem_exec_fair@basic-none@rcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][124] ([i915#2842]) -> [PASS][125] +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [SKIP][126] ([fdo#109271]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][128] ([i915#1373] / [i915#456]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb7/igt@gem_softpin@noreloc-s3.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-tglb:         [INCOMPLETE][130] ([i915#456]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-iclb:         [INCOMPLETE][132] ([i915#2910]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb7/igt@i915_pm_rpm@basic-pci-d3-state.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][134] ([i915#3921]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-snb5/igt@i915_selftest@live@hangcheck.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [INCOMPLETE][136] ([i915#456] / [i915#750]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/index.html

--===============6671820438013767286==
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
<tr><td><b>Series:</b></td><td>test/amdgpu: Add multi-eDP support to ABM test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97113/">https://patchwork.freedesktop.org/series/97113/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10907_full -&gt; IGTPW_6419_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/index.html</p>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6419_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb5/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> ([i915#4525]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb6/igt@gem_exec_capture@pi@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@gem_exec_capture@pi@vecs0.html">INCOMPLETE</a> ([i915#2369] / [i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk2/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#4555]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb8/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([i915#4555])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb5/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb3/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@kms_color@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl3/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-green-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk9/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb8/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3116]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#2828] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html">SKIP</a> ([i915#3319]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html">SKIP</a> ([i915#3359]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl7/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> ([fdo#109271]) +64 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb4/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> ([fdo#109274]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">INCOMPLETE</a> ([i915#4635])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([fdo#109271]) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">DMESG-WARN</a> ([i915#4391])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> ([fdo#109280]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb5/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb8/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html">SKIP</a> ([fdo#109278]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-none.html">SKIP</a> ([i915#3536]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([i915#1911])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb3/igt@kms_psr@psr2_dpms.html">FAIL</a> ([i915#132] / [i915#3467]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-glk6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk4/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy-hang:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl2/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">INCOMPLETE</a> ([i915#2828])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-hang:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl6/igt@kms_vblank@pipe-c-wait-forked-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl7/igt@kms_vblank@pipe-c-wait-forked-hang.html">INCOMPLETE</a> ([i915#4629])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk2/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html">SKIP</a> ([fdo#109271]) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb6/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb3/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb6/igt@prime_nv_pcopy@test1_macro.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@prime_nv_pcopy@test2.html">SKIP</a> ([fdo#109271]) +84 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb1/igt@sysfs_clients@fair-7.html">SKIP</a> ([i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-glk5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb5/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb7/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915#1373] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb2/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb7/igt@i915_pm_backlight@fade_with_suspend.html">INCOMPLETE</a> ([i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb5/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-iclb7/igt@i915_pm_rpm@basic-pci-d3-state.html">INCOMPLETE</a> ([i915#2910]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-snb5/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-snb5/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10907/shard-tglb7/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> ([i915#456] / [i915#750]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6419/shard-tglb8/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6671820438013767286==--
