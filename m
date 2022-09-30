Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7991374817610999650=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Date: Fri, 30 Sep 2022 04:07:28 -0000
Message-ID: <166451084875.23343.6899348331497451544@emeril.freedesktop.org>
References: <20220929045058.1163003-1-riana.tauro@intel.com>
In-Reply-To: <20220929045058.1163003-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgY2xlYXIg?=
 =?utf-8?q?igt=5Fdevs=2Edevs=5Fscanned_in_igt=5Fdevices=5Ffree_=28rev2=29?=
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

--===============7991374817610999650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: clear igt_devs.devs_scanned in igt_devices_free (rev2)
URL   : https://patchwork.freedesktop.org/series/108601/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12197_full -> IGTPW_7882_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7882_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7882_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/index.html

Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-tglu pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7882_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@legacy-format:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_addfb_basic@legacy-format.html

  * {igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3} (NEW):
    - {shard-dg1}:        NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-dg1-19/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
    - {shard-rkl}:        NOTRUN -> [SKIP][3] +62 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html

  * igt@prime_nv_api@i915_self_import_to_different_fd:
    - {shard-dg1}:        NOTRUN -> [SKIP][4] +57 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-dg1-12/igt@prime_nv_api@i915_self_import_to_different_fd.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12197_full and IGTPW_7882_full:

### New IGT tests (27) ###

  * igt@gem_mmap_offset@ptrace@lmem0-fixed:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@gem_mmap_offset@ptrace@smem0-fixed:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [2.63] s

  * igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.44] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.22] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_lease@lease_invalid_connector@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_lease@lease_invalid_connector@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_connector@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_connector@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_revoke@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_lease@lease_revoke@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_lease@lease_revoke@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_lease@lease_revoke@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_lease@page_flip_implicit_plane@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_lease@page_flip_implicit_plane@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_lease@page_flip_implicit_plane@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_lease@page_flip_implicit_plane@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  

Known issues
------------

  Here are the changes found in IGTPW_7882_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#4525]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#109283])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@gem_exec_params@no-bsd.html
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@gem_exec_params@no-bsd.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl6/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#4613]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +4 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#4613]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb4/igt@gem_lmem_swapping@verify.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#4270])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#4270])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb3/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#768])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb3/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#2856])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@gen9_exec_parse@unaligned-jump.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#2527] / [i915#2856])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@gen9_exec_parse@unaligned-jump.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#5286])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#5286])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#110725] / [fdo#111614])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#111614])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110723])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111615]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3886]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3689] / [i915#6095]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886]) +9 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689] / [i915#3886])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [i915#3886]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3689]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb6/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615] / [i915#3689]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk8/igt@kms_chamelium@dp-hpd.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-snb2/igt@kms_chamelium@hdmi-audio.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb7/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl7/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][48] ([i915#315] / [i915#6946]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_color@ctm-0-75@pipe-a-edp-1.html

  * igt@kms_color@ctm-0-75@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [FAIL][49] ([i915#315]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_color@ctm-0-75@pipe-c-edp-1.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][50] ([i915#2105])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb@atomic:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109274]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb@atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb@varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#109274] / [fdo#111825]) +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_cursor_legacy@cursora-vs-flipb@varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#2346])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#2672]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#2587] / [i915#2672]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#2672] / [i915#3555])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#1888] / [i915#2546])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109280] / [fdo#111825]) +11 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109280]) +10 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#6497]) +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109289])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#6988]) +31 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271]) +240 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#6988]) +33 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][69] -> [SKIP][70] ([i915#5235]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#658]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2920])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#111068] / [i915#658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#109642] / [fdo#111068] / [i915#658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([fdo#109441])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb8/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#5519])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#533])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl6/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2437])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk9/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#6971]) +43 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271]) +163 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk5/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][84] -> [FAIL][85] ([i915#5639])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@perf@polling-parameterized.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@perf@polling-parameterized.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][86] ([fdo#109271]) +191 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-snb4/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#6971]) +45 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@sysfs_clients@sema-25:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2994]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl6/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2994]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@sysfs_clients@sema-25.html
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2994]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk1/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@split-10:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2994]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb4/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - {shard-rkl}:        [SKIP][92] ([i915#2582]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@fbdev@info.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@fbdev@info.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][94] ([i915#6268]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - {shard-rkl}:        [SKIP][96] ([i915#6252]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-3/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][98] ([i915#4525]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][100] ([i915#2846]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][102] ([i915#2842]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][104] ([i915#2842]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-gtt:
    - {shard-rkl}:        [SKIP][106] ([i915#3281]) -> [PASS][107] +4 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@gem_exec_reloc@basic-gtt.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-5/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - {shard-rkl}:        [DMESG-FAIL][108] ([i915#3692]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-1/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - {shard-rkl}:        [FAIL][110] ([i915#4998] / [i915#6778]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][112] ([i915#3282]) -> [PASS][113] +4 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][114] ([i915#5566] / [i915#716]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-out:
    - {shard-rkl}:        [SKIP][116] ([i915#2527]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][118] ([i915#3989] / [i915#454]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences:
    - {shard-rkl}:        [SKIP][120] ([i915#1849]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@i915_pm_rpm@fences.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-rkl}:        [SKIP][122] ([i915#1397]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][124] ([i915#180]) -> [PASS][125] +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - {shard-rkl}:        [SKIP][126] ([i915#1845] / [i915#4098]) -> [PASS][127] +6 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [FAIL][128] ([i915#79]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - {shard-rkl}:        [SKIP][130] ([i915#1849] / [i915#4098]) -> [PASS][131] +6 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - {shard-rkl}:        [SKIP][132] ([i915#1849] / [i915#3558]) -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [SKIP][134] ([i915#5176]) -> [PASS][135] +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][136] ([i915#5235]) -> [PASS][137] +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@primary_mmap_gtt:
    - {shard-rkl}:        [SKIP][138] ([i915#1072]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-rkl-5/igt@kms_psr@primary_mmap_gtt.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][140] ([fdo#109441]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@polling-small-buf:
    - shard-tglb:         [FAIL][142] ([i915#1722]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-tglb8/igt@perf@polling-small-buf.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-tglb7/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][144] ([i915#6117]) -> [SKIP][145] ([i915#4525])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][146] ([i915#2920]) -> [SKIP][147] ([i915#658]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][148] ([fdo#111068] / [i915#658]) -> [SKIP][149] ([i915#2920])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155]) ([i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][156], [FAIL][157], [FAIL][158]) ([i915#3002] / [i915#4312])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl8/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl7/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl1/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3692]: https://gitlab.freedesktop.org/drm/intel/issues/3692
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#4998]: https://gitlab.freedesktop.org/drm/intel/issues/4998
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6778]: https://gitlab.freedesktop.org/drm/intel/issues/6778
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
  [i915#6988]: https://gitlab.freedesktop.org/drm/intel/issues/6988
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6668 -> IGTPW_7882
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7882: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/index.html
  IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/index.html

--===============7991374817610999650==
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
<tr><td><b>Series:</b></td><td>clear igt_devs.devs_scanned in igt_devices_f=
ree (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/108601/">https://patchwork.freedesktop.org/series/108601/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7882/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12197_full -&gt; IGTPW_7882_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7882_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7882_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/index.=
html</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-tglu pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7882=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_addfb_basic@legacy-format.html=
">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-dg1-19/igt@kms_color@ctm-0-75@pipe-b-hdmi-a-=
3.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-d-const=
ant-alpha-max.html">SKIP</a> +62 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import_to_different_fd:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-dg1-12/igt@prime_nv_api@i915_self_import_to_=
different_fd.html">SKIP</a> +57 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12197_full and IGTPW_7882_=
full:</p>
<h3>New IGT tests (27)</h3>
<ul>
<li>
<p>igt@gem_mmap_offset@ptrace@lmem0-fixed:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@ptrace@smem0-fixed:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_revoke@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_revoke@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_revoke@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_revoke@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7882_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/=
shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/=
shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/sh=
ard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
42">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb1/igt@gem_exec_fair@basic-none-vip@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-g=
lk7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb3/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb2/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-apl6/igt@gem_lmem_swapping@parallel-random-ve=
rify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb7/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-glk3/igt@gem_lmem_swapping@random-engines.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb4/igt@gem_lmem_swapping@verify.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i91=
5#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb4/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb3/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@gem_render_copy@y-tiled-to-vebox-y=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb3/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb1/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb1/igt@gen9_exec_parse@unaligned-jump.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb2/igt@gen9_exec_parse@unaligned-jump.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
86">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
86">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-glk8/igt@kms_ccs@pipe-a-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb5/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb8/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb6/igt@kms_ccs@pipe-d-bad-pixel-format-yf=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-glk8/igt@kms_chamelium@dp-hpd.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827"=
>fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-snb2/igt@kms_chamelium@hdmi-audio.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
27">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb7/igt@kms_chamelium@hdmi-audio.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo=
#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb5/igt@kms_chamelium@hdmi-cmp-planar-form=
ats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-apl7/igt@kms_chamelium@vga-hpd-after-suspend=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_color@ctm-0-75@pipe-a-edp-1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6946">i915#6946</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_color@ctm-0-75@pipe-c-edp-1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-apl7/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb@atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb=
@atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb@varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_cursor_legacy@cursora-vs-flipb=
@varying-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7882/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7882/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-prims=
crn-cur-indfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +11 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6497">i915#6497</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb1/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7882/shard-apl1/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha=
-7efc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6988">i915#6988</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +240 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-mid:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_plane_alpha_blend@pipe-c-const=
ant-alpha-mid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6988">i915#6988</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb6/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_plane_scaling@plan=
es-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-glk2/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard=
-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-icl=
b8/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@kms_psr_stress_test@flip-primary-i=
nvalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-apl6/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-glk9/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6971">i915#6971</a>) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-glk5/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +163 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@perf@polling-parameterized.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-icl=
b7/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5639">i915#5639</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-snb4/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +191 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb1/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6971">i915#6971</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-apl6/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-tglb8/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7882/shard-glk1/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7882/shard-iclb4/igt@sysfs_clients@split-10.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@fbdev@info.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@fbd=
ev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882=
/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
252">i915#6252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7882/shard-rkl-3/igt@gem_ctx_persistence@legacy-engines-hang@blt.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7882/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/sh=
ard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7882/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
82/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-2/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard=
-rkl-5/igt@gem_exec_reloc@basic-gtt.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3692">i915=
#3692</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7882/shard-rkl-1/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4998">i915#4998<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6778">i915=
#6778</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7882/shard-rkl-5/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard=
-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-glk5/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7882/shard-glk1/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/s=
hard-rkl-5/igt@gen9_exec_parse@bb-start-out.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-i=
clb7/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@i915_pm_rpm@fences.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6=
/igt@i915_pm_rpm@fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#13=
97</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_788=
2/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl6/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/s=
hard-apl1/igt@i915_suspend@sysfs-reader.html">PASS</a> +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-180-hflip.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915=
#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
82/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
49">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-line=
ar.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-2/igt@kms_plane@pixel-format-source-clamping@pipe-b=
-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7882/shard-rkl-6/igt@kms_plane@pixel-format-source-=
clamping@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb7/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.ht=
ml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-iclb3/igt@kms_plane_=
scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a-edp-1.html">=
PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-rkl-5/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard=
-rkl-6/igt@kms_psr@primary_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
82/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-tglb8/igt@perf@polling-small-buf.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-t=
glb7/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7882/shard-iclb6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7882/shard-iclb8/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12197/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7882/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12197/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12197/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12197/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12197/shard-apl1/igt@runner@aborted.=
html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7882/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/shard-apl1/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7882/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6668 -&gt; IGTPW_7882</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7882: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7882/index.htm=
l<br />
  IGT_6668: 5f29c9369550164b35b65baaaeba4b370f434cf1 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7991374817610999650==--
