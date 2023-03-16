Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0983447630102164480=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack@kde.org>
Date: Thu, 16 Mar 2023 08:19:42 -0000
Message-ID: <167895478237.19094.8149303813316312816@emeril.freedesktop.org>
References: <20230316022659.73202-1-zack@kde.org>
In-Reply-To: <20230316022659.73202-1-zack@kde.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHZt?=
 =?utf-8?q?wgfx_support_=28rev2=29?=
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

--===============0983447630102164480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add vmwgfx support (rev2)
URL   : https://patchwork.freedesktop.org/series/111441/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12867_full -> IGTPW_8617_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8617_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8617_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8617_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][1] +183 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_flip@flip-vs-fences-interruptible@a-dp1:
    - shard-apl:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl4/igt@kms_flip@flip-vs-fences-interruptible@a-dp1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl4/igt@kms_flip@flip-vs-fences-interruptible@a-dp1.html

  * {igt@vmwgfx/execution_buffer@mob-create-map} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][4] +14 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-3/igt@vmwgfx/execution_buffer@mob-create-map.html

  * {igt@vmwgfx/mob_stress@max_mob_mem_stress} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][5] +78 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-dg1-17/igt@vmwgfx/mob_stress@max_mob_mem_stress.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ctx_isolation@preservation-s3@vcs1:
    - {shard-tglu}:       [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-3/igt@gem_ctx_isolation@preservation-s3@vcs1.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@gem_ctx_isolation@preservation-s3@vcs1.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
    - {shard-rkl}:        [SKIP][8] ([i915#4098]) -> [TIMEOUT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - {shard-rkl}:        [SKIP][10] ([fdo#111825] / [i915#1825]) -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
    - {shard-rkl}:        [SKIP][12] ([i915#1845] / [i915#4098]) -> [TIMEOUT][13] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-3/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12867_full and IGTPW_8617_full:

### New IGT tests (204) ###

  * igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-aux-stride-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-yf_tiled_ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-yf_tiled_ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_concurrent@pipe-g:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_concurrent@pipe-h:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@cursor-fb-leak-pipe-g:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@cursor-fb-leak-pipe-h:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-g:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-h:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-g:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-h:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-g-functional:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-g-sanity:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-h-functional:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-h-sanity:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-accuracy-idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-busy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-busy-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked-busy-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-idle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-idle-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-dpms-rpm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-dpms-suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-idle-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-modeset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-modeset-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-modeset-rpm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-suspend:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked-busy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-idle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-idle-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-accuracy-idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-busy-hang:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-idle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-idle-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-idle-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-modeset:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-modeset-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-modeset-rpm:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-busy-hang:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-forked:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-forked-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-forked-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-forked-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-idle-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/execution_buffer@buffer-create:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/execution_buffer@execution-buffer-submit-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/execution_buffer@mob-create-map:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/mob_stress@max_mob_mem_stress:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@mob_repeated_unref:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@surface_alloc_ref_unref:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@surface_prime_transfer_explicit_mob:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@surface_prime_transfer_fd_dup:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@surface_prime_transfer_implicit_mob:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@surface_prime_transfer_single_surface_multiple_handle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@surface_prime_transfer_two_surfaces:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/ref_count@surface_repeated_unref:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/surface_copy@test_invalid_copies:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/surface_copy@test_invalid_copies_3d:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/tri@tri:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/tri@tri-no-sync-coherent:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8617_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@verify:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl1/igt@gem_lmem_swapping@verify.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#3886]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * {igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][21] ([fdo#109271]) +240 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk8/igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * {igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][22] ([i915#4098]) +141 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271]) +233 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2346])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#2346])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#2122])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * {igt@kms_universal_plane@disable-primary-vs-flip-pipe-g} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][32] ([i915#4070] / [i915#4098]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-g.html
    - {shard-tglu}:       NOTRUN -> [SKIP][33] ([fdo#109274])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@kms_universal_plane@disable-primary-vs-flip-pipe-g.html

  * {igt@kms_universal_plane@universal-plane-pipe-h-functional} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][34] ([fdo#109271]) +203 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-snb4/igt@kms_universal_plane@universal-plane-pipe-h-functional.html

  * {igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][35] ([i915#4070]) +14 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm.html

  * {igt@vmwgfx/surface_copy@test_invalid_copies_3d} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][36] ([i915#2575]) +15 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-1/igt@vmwgfx/surface_copy@test_invalid_copies_3d.html

  
#### Possible fixes ####

  * igt@drm_read@empty-nonblock:
    - {shard-rkl}:        [SKIP][37] ([i915#1845] / [i915#4098]) -> [PASS][38] +18 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@drm_read@empty-nonblock.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@drm_read@empty-nonblock.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][39] ([i915#2842]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - {shard-rkl}:        [SKIP][41] ([i915#3281]) -> [PASS][42] +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_mmap_gtt@coherency:
    - {shard-rkl}:        [SKIP][43] ([fdo#111656]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@gem_mmap_gtt@coherency.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pread@snoop:
    - {shard-rkl}:        [SKIP][45] ([i915#3282]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-2/igt@gem_pread@snoop.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gem_pread@snoop.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [ABORT][47] ([i915#5566]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [ABORT][49] ([i915#5566]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - {shard-rkl}:        [SKIP][51] ([i915#2527]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-tglu}:       [SKIP][53] ([i915#4281]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-3/igt@i915_pm_dc@dc9-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@cursor-dpms:
    - {shard-tglu}:       [SKIP][55] ([i915#1849]) -> [PASS][56] +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-9/igt@i915_pm_rpm@cursor-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-1/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - {shard-rkl}:        [SKIP][57] ([fdo#109308]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@i915_pm_rpm@drm-resources-equal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [FAIL][59] ([i915#6537]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl7/igt@i915_pm_rps@engine-order.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl2/igt@i915_pm_rps@engine-order.html

  * igt@i915_selftest@live@gt_pm:
    - {shard-rkl}:        [DMESG-FAIL][61] ([i915#4258]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-6/igt@i915_selftest@live@gt_pm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-4/igt@i915_selftest@live@gt_pm.html

  * igt@kms_atomic@plane-immutable-zpos:
    - {shard-tglu}:       [SKIP][63] ([i915#1845]) -> [PASS][64] +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-10/igt@kms_atomic@plane-immutable-zpos.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-4/igt@kms_atomic@plane-immutable-zpos.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][65] ([i915#2346]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - {shard-rkl}:        [SKIP][67] ([i915#4098]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fence_pin_leak:
    - {shard-tglu}:       [SKIP][69] ([fdo#109274] / [i915#1845]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-10/igt@kms_fence_pin_leak.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-8/igt@kms_fence_pin_leak.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][71] ([i915#2122]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][73] ([i915#1849] / [i915#4098]) -> [PASS][74] +10 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr@sprite_render:
    - {shard-rkl}:        [SKIP][75] ([i915#1072]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@kms_psr@sprite_render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_psr@sprite_render.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - {shard-tglu}:       [SKIP][77] ([fdo#109274]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-9/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@kms_vblank@pipe-d-wait-busy:
    - {shard-tglu}:       [SKIP][79] ([i915#1845] / [i915#7651]) -> [PASS][80] +14 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-9/igt@kms_vblank@pipe-d-wait-busy.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-2/igt@kms_vblank@pipe-d-wait-busy.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - {shard-rkl}:        [SKIP][81] ([fdo#109289]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@prime_vgem@basic-fence-read:
    - {shard-rkl}:        [SKIP][83] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-1/igt@prime_vgem@basic-fence-read.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - {shard-rkl}:        [SKIP][85] ([fdo#109295] / [fdo#111656] / [i915#3708]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-2/igt@prime_vgem@coherency-gtt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@prime_vgem@coherency-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8154]: https://gitlab.freedesktop.org/drm/intel/issues/8154
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8273]: https://gitlab.freedesktop.org/drm/intel/issues/8273
  [i915#8282]: https://gitlab.freedesktop.org/drm/intel/issues/8282


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7196 -> IGTPW_8617
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12867: 67d4276f8342780b8eaa6e9f5c15d979254a5675 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8617: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/index.html
  IGT_7196: 9b8c5dbe8cd82163ee198c43b81222d2b9b75fd4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/index.html

--===============0983447630102164480==
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
<tr><td><b>Series:</b></td><td>Add vmwgfx support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111441/">https://patchwork.freedesktop.org/series/111441/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12867_full -&gt; IGTPW_8617_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8617_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8617_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8617_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> +183 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl4/igt@kms_flip@flip-vs-fences-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl4/igt@kms_flip@flip-vs-fences-interruptible@a-dp1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@vmwgfx/execution_buffer@mob-create-map} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-3/igt@vmwgfx/execution_buffer@mob-create-map.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@vmwgfx/mob_stress@max_mob_mem_stress} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-dg1-17/igt@vmwgfx/mob_stress@max_mob_mem_stress.html">SKIP</a> +78 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs1:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-3/igt@gem_ctx_isolation@preservation-s3@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@gem_ctx_isolation@preservation-s3@vcs1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-3/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12867_full and IGTPW_8617_full:</p>
<h3>New IGT tests (204)</h3>
<ul>
<li>
<p>igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-g:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-h:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-g:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-h:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-g:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-h:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-g:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-h:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-g-functional:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-g-sanity:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-h-functional:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-h-sanity:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-accuracy-idle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-busy:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-busy-hang:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-forked:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-forked-busy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-forked-busy-hang:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-forked-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-idle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-idle-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-dpms-rpm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-dpms-suspend:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-idle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-idle-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-modeset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-modeset-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-modeset-rpm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-ts-continuation-suspend:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-busy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-busy-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-forked:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-forked-busy:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-forked-busy-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-forked-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-idle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-wait-idle-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-accuracy-idle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-busy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-busy-hang:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-forked:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-forked-busy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-forked-busy-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-forked-hang:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-idle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-query-idle-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-idle:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-idle-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-modeset:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-modeset-hang:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-modeset-rpm:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-suspend:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-busy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-busy-hang:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-forked:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-forked-busy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-forked-busy-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-forked-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-idle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-idle-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/execution_buffer@buffer-create:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/execution_buffer@execution-buffer-submit-sync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/execution_buffer@mob-create-map:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/mob_stress@max_mob_mem_stress:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@mob_repeated_unref:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@surface_alloc_ref_unref:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@surface_prime_transfer_explicit_mob:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@surface_prime_transfer_fd_dup:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@surface_prime_transfer_implicit_mob:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@surface_prime_transfer_single_surface_multiple_handle:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@surface_prime_transfer_two_surfaces:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/ref_count@surface_repeated_unref:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/surface_copy@test_invalid_copies:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/surface_copy@test_invalid_copies_3d:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/tri@tri:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/tri@tri-no-sync-coherent:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8617_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl1/igt@gem_lmem_swapping@verify.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl3/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk8/igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +240 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +141 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl1/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +233 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk4/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_universal_plane@disable-primary-vs-flip-pipe-g} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) +1 similar issue</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@kms_universal_plane@disable-primary-vs-flip-pipe-g.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_universal_plane@universal-plane-pipe-h-functional} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-snb4/igt@kms_universal_plane@universal-plane-pipe-h-functional.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +203 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@vmwgfx/surface_copy@test_invalid_copies_3d} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-1/igt@vmwgfx/surface_copy@test_invalid_copies_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +15 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@empty-nonblock:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@drm_read@empty-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@drm_read@empty-nonblock.html">PASS</a> +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-2/igt@gem_pread@snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gem_pread@snoop.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk2/igt@gen9_exec_parse@allowed-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk2/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-3/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-10/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-9/igt@i915_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-1/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109308">fdo#109308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl7/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl2/igt@i915_pm_rps@engine-order.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-6/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-4/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-immutable-zpos:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-10/igt@kms_atomic@plane-immutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-4/igt@kms_atomic@plane-immutable-zpos.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-10/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-8/igt@kms_fence_pin_leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@kms_psr@sprite_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@kms_psr@sprite_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-c-functional:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-9/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-tglu-9/igt@kms_vblank@pipe-d-wait-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-tglu-2/igt@kms_vblank@pipe-d-wait-busy.html">PASS</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-6/igt@perf@gen12-unprivileged-single-ctx-counters.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@prime_vgem@basic-fence-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12867/shard-rkl-2/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7196 -&gt; IGTPW_8617</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12867: 67d4276f8342780b8eaa6e9f5c15d979254a5675 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8617: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8617/index.html<br />
  IGT_7196: 9b8c5dbe8cd82163ee198c43b81222d2b9b75fd4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0983447630102164480==--
