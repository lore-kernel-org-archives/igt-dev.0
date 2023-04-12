Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3525891094740746427=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zack Rusin" <zack@kde.org>
Date: Wed, 12 Apr 2023 14:07:40 -0000
Message-ID: <168130846030.10848.9388972806966592234@emeril.freedesktop.org>
References: <20230412023329.465551-1-zack@kde.org>
In-Reply-To: <20230412023329.465551-1-zack@kde.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHZt?=
 =?utf-8?q?wgfx_support_=28rev3=29?=
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

--===============3525891094740746427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add vmwgfx support (rev3)
URL   : https://patchwork.freedesktop.org/series/111441/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12993_full -> IGTPW_8784_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8784_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][1] +180 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-5/igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][2] +97 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-dg1-14/igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend.html

  * {igt@vmwgfx/vmw_ref_count@surface_prime_transfer_single_surface_multiple_handle} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][3] +14 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-1/igt@vmwgfx/vmw_ref_count@surface_prime_transfer_single_surface_multiple_handle.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12993_full and IGTPW_8784_full:

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
    - Statuses : 6 skip(s)
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
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-pixel-format-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-bad-rotation-90-yf_tiled_ccs:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-ccs-on-another-bo-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-basic-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-primary-rotation-180-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-crc-sprite-planes-basic-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-missing-ccs-buffer-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-g-random-ccs-data-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-aux-stride-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-pixel-format-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
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
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-bad-rotation-90-yf_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-ccs-on-another-bo-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-basic-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-primary-rotation-180-yf_tiled_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-crc-sprite-planes-basic-y_tiled_ccs:
    - Statuses : 5 skip(s)
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
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-missing-ccs-buffer-yf_tiled_ccs:
    - Statuses : 5 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_mc_ccs:
    - Statuses : 6 skip(s)
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
    - Statuses : 5 skip(s)
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
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-h:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-g:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-h:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-g-functional:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-g-sanity:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-h-functional:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_universal_plane@universal-plane-pipe-h-sanity:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-accuracy-idle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked-busy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-forked-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-query-idle-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-dpms-rpm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-dpms-suspend:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-ts-continuation-idle-hang:
    - Statuses : 6 skip(s)
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
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked-busy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked-busy-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-forked-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-idle:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-g-wait-idle-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-accuracy-idle:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-busy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-busy-hang:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked-busy:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-forked-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-idle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-query-idle-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-idle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-idle-hang:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-modeset:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-modeset-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-modeset-rpm:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-ts-continuation-suspend:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-busy:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-busy-hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_vblank@pipe-h-wait-forked:
    - Statuses : 6 skip(s)
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

  * igt@vmwgfx/vmw_execution_buffer@buffer-create:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_execution_buffer@execution-buffer-submit-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_execution_buffer@mob-create-map:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_mob_stress@max_mob_mem_stress:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@mob_repeated_unref:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@surface_alloc_ref_unref:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_explicit_mob:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_fd_dup:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_implicit_mob:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_single_surface_multiple_handle:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@surface_prime_transfer_two_surfaces:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_ref_count@surface_repeated_unref:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_surface_copy@test_invalid_copies:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_surface_copy@test_invalid_copies_3d:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_tri@tri:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@vmwgfx/vmw_tri@tri-no-sync-coherent:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8784_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-apl:          [PASS][4] -> [ABORT][5] ([i915#8211] / [i915#8234])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl2/igt@gem_barrier_race@remote-request@rcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl3/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-glk:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk6/igt@gem_huc_copy@huc-copy.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][7] -> [ABORT][8] ([i915#5566])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl6/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#3886]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc (NEW):
    - shard-glk:          NOTRUN -> [SKIP][12] ([fdo#109271]) +209 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk8/igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-g-crc-primary-basic-yf_tiled_ccs (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][13] ([i915#5354]) +115 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-4/igt@kms_ccs@pipe-g-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_ccs (NEW):
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271]) +209 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl4/igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2346])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2122])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          NOTRUN -> [FAIL][19] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-h (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][20] ([i915#4070]) +57 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-h.html

  * igt@kms_universal_plane@universal-plane-pipe-h-functional (NEW):
    - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271]) +203 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-snb5/igt@kms_universal_plane@universal-plane-pipe-h-functional.html

  * {igt@vmwgfx/vmw_execution_buffer@mob-create-map} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][22] ([i915#2575]) +15 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-7/igt@vmwgfx/vmw_execution_buffer@mob-create-map.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - {shard-rkl}:        [FAIL][23] ([i915#7742]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][25] ([i915#2842]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][27] ([i915#2842]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - {shard-rkl}:        [FAIL][29] ([i915#2842]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-rkl-3/igt@gem_exec_fair@basic-pace@rcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][31] ([i915#5566]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk7/igt@gen9_exec_parse@allowed-single.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk9/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-tglu}:       [FAIL][33] ([i915#3989] / [i915#454]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-tglu-8/igt@i915_pm_dc@dc6-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-tglu}:       [SKIP][35] ([i915#4281]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - {shard-rkl}:        [SKIP][37] ([i915#1397]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-2/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [ABORT][39] ([i915#180]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@perf@stress-open-close@0-rcs0:
    - shard-glk:          [ABORT][41] ([i915#5213]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk7/igt@perf@stress-open-close@0-rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk7/igt@perf@stress-open-close@0-rcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5431]: https://gitlab.freedesktop.org/drm/intel/issues/5431
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
  [i915#8150]: https://gitlab.freedesktop.org/drm/intel/issues/8150
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7250 -> IGTPW_8784
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12993: 3f6d1a580787c3aa8c9c7f174bdce5b055d6d724 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8784: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/index.html
  IGT_7250: 2da179d399d83a6859a89176d83b7ec1d71fe27a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/index.html

--===============3525891094740746427==
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
<tr><td><b>Series:</b></td><td>Add vmwgfx support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111441/">https://patchwork.freedesktop.org/series/111441/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12993_full -&gt; IGTPW_8784_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8784_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-5/igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> +180 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-dg1-14/igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend.html">SKIP</a> +97 similar issues</li>
</ul>
</li>
<li>
<p>{igt@vmwgfx/vmw_ref_count@surface_prime_transfer_single_surface_multiple_handle} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-1/igt@vmwgfx/vmw_ref_count@surface_prime_transfer_single_surface_multiple_handle.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12993_full and IGTPW_8784_full:</p>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-ccs-on-another-bo-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-h-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-g-functional:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-accuracy-idle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-busy:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-busy-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-forked-busy-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-g-query-idle-hang:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 4 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
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
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-dpms-rpm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-dpms-suspend:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-idle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-idle-hang:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-modeset:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-modeset-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-ts-continuation-modeset-rpm:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
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
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-busy-hang:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-h-wait-forked:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
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
<p>igt@vmwgfx/vmw_execution_buffer@buffer-create:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_execution_buffer@execution-buffer-submit-sync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_execution_buffer@mob-create-map:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_mob_stress@max_mob_mem_stress:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@mob_repeated_unref:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@surface_alloc_ref_unref:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@surface_prime_transfer_explicit_mob:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@surface_prime_transfer_fd_dup:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@surface_prime_transfer_implicit_mob:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@surface_prime_transfer_single_surface_multiple_handle:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@surface_prime_transfer_two_surfaces:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_ref_count@surface_repeated_unref:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_surface_copy@test_invalid_copies:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_surface_copy@test_invalid_copies_3d:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_tri@tri:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vmwgfx/vmw_tri@tri-no-sync-coherent:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8784_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl2/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl3/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8234">i915#8234</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl4/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk8/igt@kms_ccs@pipe-g-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +209 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-crc-primary-basic-yf_tiled_ccs (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-4/igt@kms_ccs@pipe-g-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +115 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_ccs (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl4/igt@kms_ccs@pipe-g-random-ccs-data-y_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +209 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-h (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-h.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-h-functional (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-snb5/igt@kms_universal_plane@universal-plane-pipe-h-functional.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +203 similar issues</li>
</ul>
</li>
<li>
<p>{igt@vmwgfx/vmw_execution_buffer@mob-create-map} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-7/igt@vmwgfx/vmw_execution_buffer@mob-create-map.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +15 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-2/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-rkl-3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk7/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk9/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-tglu-8/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-10/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-tglu-7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-tglu-2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-rkl-7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-rkl-2/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close@0-rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12993/shard-glk7/igt@perf@stress-open-close@0-rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/shard-glk7/igt@perf@stress-open-close@0-rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7250 -&gt; IGTPW_8784</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12993: 3f6d1a580787c3aa8c9c7f174bdce5b055d6d724 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8784: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8784/index.html<br />
  IGT_7250: 2da179d399d83a6859a89176d83b7ec1d71fe27a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3525891094740746427==--
