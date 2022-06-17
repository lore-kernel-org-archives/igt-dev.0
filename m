Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7669405049429718620=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Fri, 17 Jun 2022 20:30:48 -0000
Message-ID: <165549784833.20134.4302463108818212@emeril.freedesktop.org>
References: <20220617110828.26508-1-swati2.sharma@intel.com>
In-Reply-To: <20220617110828.26508-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fflip=5Fscaled=5Fcrc=3A_New_tests_=28rev2=29?=
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

--===============7669405049429718620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_flip_scaled_crc: New tests (rev2)
URL   : https://patchwork.freedesktop.org/series/105148/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6535_full -> IGTPW_7334_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7334_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7334_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7334_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-tglb8/igt@gem_ctx_exec@basic-nohangcheck.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html

  * {igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +22 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][4] +13 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5] +22 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][6] +19 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][7] +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb7/igt@perf_pmu@module-unload.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@perf_pmu@module-unload.html

  
New tests
---------

  New tests have been introduced between IGT_6535_full and IGTPW_7334_full:

### New IGT tests (85) ###

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.32] s

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.02, 0.35] s

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.46, 1.33] s

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.49, 2.86] s

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.45] s

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.45, 1.19] s

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.33, 1.15] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.30, 1.18] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.29, 1.22] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.05, 0.34] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 skip(s)
    - Exec time: [0.06, 0.36] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.10, 0.40] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.05, 0.35] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 3 pass(s) 1 skip(s)
    - Exec time: [0.33, 1.20] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.32] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s)
    - Exec time: [1.14] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.33] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.03, 1.20] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.47, 1.14] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.36, 1.17] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.31, 1.17] s

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 2 pass(s) 1 skip(s)
    - Exec time: [0.31, 1.13] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.32] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.31] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 skip(s)
    - Exec time: [0.06, 0.77] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.51, 1.13] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.19, 2.81] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 2 fail(s) 2 pass(s)
    - Exec time: [0.72, 1.17] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 2 fail(s) 1 skip(s)
    - Exec time: [0.27, 1.78] s

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [0.51, 1.13] s

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.19, 1.17] s

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.32] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.45, 1.18] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 fail(s) 2 skip(s)
    - Exec time: [0.18, 1.21] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.39, 1.16] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 2 fail(s) 2 skip(s)
    - Exec time: [0.20, 1.17] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.04, 1.17] s

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.04, 1.14] s

  

Known issues
------------

  Here are the changes found in IGTPW_7334_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#5507])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@device_reset@unbind-reset-rebind.html
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#5507])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-glk2/igt@device_reset@unbind-reset-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk2/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#3555] / [i915#5325])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@gem_ccs@block-copy-inplace.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#5327])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb7/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#1099]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-snb2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][17] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#4525])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2842]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#2842]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#2849])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109283])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@gem_exec_params@rsvd2-dirt.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#4613]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-multi.html
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#4613]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#4613]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl1/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#4270])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#4270]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#768])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-glk:          NOTRUN -> [FAIL][39] ([i915#4171])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk8/igt@gem_softpin@evict-single-offset.html
    - shard-kbl:          NOTRUN -> [FAIL][40] ([i915#4171])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#3297])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@gem_userptr_blits@readonly-unsync.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271]) +216 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl2/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][44] -> [DMESG-WARN][45] ([i915#5566] / [i915#716])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-glk4/igt@gen9_exec_parse@allowed-single.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#2527] / [i915#2856]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#2856]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][48] -> [DMESG-WARN][49] ([i915#5591])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-tglb7/igt@i915_selftest@live@hangcheck.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][50] -> [DMESG-WARN][51] ([i915#180]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][52] -> [DMESG-WARN][53] ([i915#180]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#5286]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#5286])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271]) +181 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-snb5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#110723])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111615]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#6095]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111615] / [i915#3689]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271]) +265 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689] / [i915#6095])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3886]) +9 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl4/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk7/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#3886])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3689]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb3/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk6/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [i915#1149]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-degamma:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-snb4/igt@kms_color_chamelium@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb1/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278]) +24 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109279] / [i915#3359])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#4103])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][78] -> [FAIL][79] ([i915#2346] / [i915#533])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#5287])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#5287])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb5/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [FAIL][82] ([i915#4767])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109274]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:
    - shard-glk:          [PASS][84] -> [FAIL][85] ([i915#2122])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-glk3/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#5438])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109280]) +13 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109280] / [fdo#111825]) +9 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#533])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][90] ([i915#265])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][91] ([fdo#108145] / [i915#265]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][92] ([fdo#108145] / [i915#265]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk9/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][93] ([i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][94] ([fdo#108145] / [i915#265]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#5288])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#5176]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [PASS][98] -> [SKIP][99] ([i915#5176]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [PASS][100] -> [SKIP][101] ([i915#5235]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][102] ([fdo#109271]) +110 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2920])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#111068] / [i915#658])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-kbl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#658]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-apl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#658]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][107] -> [SKIP][108] ([fdo#109441])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109441])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb3/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][110] ([IGT#2])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_writeback@writeback-check-output:
    - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#2437])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2437])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl7/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#2530])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109291]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109291]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@sw_sync@sync_merge:
    - shard-apl:          NOTRUN -> [FAIL][116] ([i915#6140])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl7/igt@sw_sync@sync_merge.html

  * igt@sysfs_clients@fair-1:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#2994])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@sysfs_clients@fair-1.html
    - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2994])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk8/igt@sysfs_clients@fair-1.html
    - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#2994])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb5/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@fair-3:
    - shard-apl:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#2994]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl6/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#2994]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@sysfs_clients@recycle.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][122] ([i915#658]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb8/igt@feature_discovery@psr2.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-snb:          [INCOMPLETE][124] -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-snb5/igt@gem_eio@in-flight-contexts-10ms.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-snb5/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][126] ([i915#4525]) -> [PASS][127] +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-iclb:         [INCOMPLETE][128] ([i915#3371]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb1/igt@gem_exec_capture@pi@vcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][132] ([i915#2842]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglb:         [FAIL][134] ([i915#2842]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][136] ([i915#5566] / [i915#716]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][138] ([i915#5566] / [i915#716]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl7/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][140] ([i915#2346]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][142] ([i915#180] / [i915#1982] / [i915#4939]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][144] ([i915#180]) -> [PASS][145] +3 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [FAIL][146] ([i915#1188]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][148] ([fdo#109441]) -> [PASS][149] +3 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][150] ([i915#5784]) -> [TIMEOUT][151] ([i915#3063])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@kms_content_protection@mei_interface:
    - shard-tglb:         [SKIP][152] ([i915#1063]) -> [SKIP][153] ([fdo#109300])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-tglb5/igt@kms_content_protection@mei_interface.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb8/igt@kms_content_protection@mei_interface.html
    - shard-iclb:         [SKIP][154] ([fdo#109300] / [fdo#111066]) -> [SKIP][155] ([fdo#109300])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb4/igt@kms_content_protection@mei_interface.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_content_protection@mei_interface.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][156] ([i915#4767]) -> [INCOMPLETE][157] ([i915#180])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [DMESG-FAIL][158] ([i915#180]) -> [DMESG-WARN][159] ([i915#180])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][160] ([i915#658]) -> [SKIP][161] ([i915#2920]) +1 similar issue
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][162] ([i915#2920]) -> [SKIP][163] ([i915#658])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][164], [FAIL][165], [FAIL][166], [FAIL][167], [FAIL][168], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][174], [FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179], [FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl7/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl1/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl1/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl7/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@aborted.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@runner@aborted.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@aborted.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@aborted.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@aborted.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@runner@aborted.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3371]: https://gitlab.freedesktop.org/drm/intel/issues/3371
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5438]: https://gitlab.freedesktop.org/drm/intel/issues/5438
  [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6535 -> IGTPW_7334

  CI-20190529: 20190529
  CI_DRM_11775: 93bea5a783b94aa5336606ddee482f659ccd9804 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html
  IGT_6535: c30662230963df6e6dba0f5df4792840b2feae85 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.html

--===============7669405049429718620==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_flip_scaled_crc: New tests (r=
ev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105148/">https://patchwork.freedesktop.org/series/105148/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7334/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6535_full -&gt; IGTPW_7334_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7334_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7334_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.=
html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7334=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-tglb8/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tgl=
b5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pip=
e-a-valid-mode} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> +22 similar =
issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscalin=
g@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">FAIL</a> +13 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@p=
ipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> +22 simila=
r issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-=
a-valid-mode} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> +19 similar is=
sues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pip=
e-a-valid-mode} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">FAIL</a> +7 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb7/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@p=
erf_pmu@module-unload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6535_full and IGTPW_7334_full=
:</p>
<h3>New IGT tests (85)</h3>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.02, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.46, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [0.49, 2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.45, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.33, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.30, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.29, 1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.05, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.06, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.10, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.05, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.33, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.03, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.47, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.36, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.31, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.31, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.06, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.51, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.19, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 fail(s) 2 pass(s)</li>
<li>Exec time: [0.72, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 2 fail(s) 1 skip(s)</li>
<li>Exec time: [0.27, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [0.51, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 2 fail(s) 3 skip(s)</li>
<li>Exec time: [0.19, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.45, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 3 fail(s) 2 skip(s)</li>
<li>Exec time: [0.18, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.39, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>Statuses : 2 fail(s) 2 skip(s)</li>
<li>Exec time: [0.20, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.04, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.04, 1.14] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7334_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6535/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl=
1/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6535/shard-glk2/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk=
2/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-tglb2/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/53=
25">i915#5325</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb7/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i9=
15#5327</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-snb2/igt@gem_ctx_persistence@smoketest.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@gem_eio@in-flight-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb4/igt@gem_exec_balancer@parallel-balancer.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shar=
d-iclb5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-=
apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard=
-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl3/=
igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-=
iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb6/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-tglb5/igt@gem_exec_params@rsvd2-dirt.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">f=
do#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb3/igt@gem_lmem_swapping@heavy-verify-mult=
i.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-mult=
i.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl1/igt@gem_lmem_swapping@verify-random-ccs=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@gem_pxp@reject-modify-context-prot=
ection-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@gem_pxp@verify-pxp-key-change-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-glk8/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-kbl1/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb4/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-tglb6/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl2/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +216 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-glk4/igt@gen9_exec_parse@allowed-single.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-glk7=
/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@gen9_exec_parse@batch-zero-length.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@gen9_exec_parse@bb-start-far.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856"=
>i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-tglb7/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb1=
/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-kbl4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/ig=
t@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/=
shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-snb5/igt@kms_big_fb@y-tiled-64bpp-rotate-180=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a>) +181 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@kms_big_fb@yf-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl3/igt@kms_ccs@pipe-a-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb5/igt@kms_ccs@pipe-b-bad-aux-stride-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@kms_ccs@pipe-b-bad-pixel-format-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +265 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-kbl4/igt@kms_ccs@pipe-c-crc-primary-basic-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-glk7/igt@kms_ccs@pipe-c-crc-primary-basic-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-basic-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb3/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-glk6/igt@kms_chamelium@dp-edid-change-during=
-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@kms_chamelium@vga-hpd-fast.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_color@pipe-d-ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1149">i915#1149</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-0-2=
5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-degamma:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-snb4/igt@kms_color_chamelium@pipe-b-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb1/igt@kms_color_chamelium@pipe-c-ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-ato=
mic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-ren=
der-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5287">i915#5287</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb5/igt@kms_draw_crc@draw-method-rgb565-ren=
der-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5287">i915#5287</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-glk3/igt@kms_fbcon_fbt@fbc-suspend.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i91=
5#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@kms_flip@2x-flip-vs-panning.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-glk3/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/sha=
rd-glk5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5438">i915#5438</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +13 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +9 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pi=
pe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-apl3/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-glk9/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb7/igt@kms_plane_scaling@2x-scaler-multi-=
pipe.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb1/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-75@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb3/igt@kms_plane_scaling@=
plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5=
176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb8/igt@kms_plane_scaling@planes-unity-scaling-downscale-=
factor-0-5@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/igt@kms_plane_scaling@planes-u=
nity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-glk2/igt@kms_plane_scaling@planes-upscale-fa=
ctor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +110 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-tglb6/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb3/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl4/igt@kms_psr2_su@frontbuffer-xrgb8888.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl7/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb6/igt=
@kms_psr@psr2_primary_blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb3/igt@kms_psr@psr2_sprite_plane_onoff.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@kms_sysfs_edid_timing.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IG=
T#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl7/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb7/igt@nouveau_crc@pipe-a-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-iclb4/igt@prime_nv_test@nv_write_i915_gtt_mm=
ap_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl7/igt@sw_sync@sync_merge.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6140">i915#6140<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-tglb2/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-glk8/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7334/shard-iclb5/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-apl6/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7334/shard-kbl1/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2/i=
gt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-snb5/igt@gem_eio@in-flight-contexts-10ms.html">INCOMPLETE</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/sha=
rd-snb5/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7334/shard-iclb1/igt@gem_exec_balancer@parallel-keep-in-fence.html">PASS<=
/a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb1/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3371">i915#3371</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/sha=
rd-iclb4/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard=
-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/=
shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-tglb3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shar=
d-tglb5/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-glk1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#=
716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
34/shard-glk7/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-apl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#55=
66</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i9=
15#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7334/shard-apl7/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transition=
s.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7334/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i9=
15#4939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7334/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7334/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shar=
d-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb3/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-iclb2=
/igt@kms_psr@psr2_no_drrs.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-tglb5/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-tglb7=
/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6535/shard-tglb5/igt@kms_content_protection@mei_interface.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i915#10=
63</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_733=
4/shard-tglb8/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109300</a=
>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6535/shard-iclb4/igt@kms_content_protection@mei_interface.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10=
9300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111066=
">fdo#111066</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7334/shard-iclb6/igt@kms_content_protection@mei_interface.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo=
#109300</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kb=
l7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">DMESG=
-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7334/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-=
sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7334/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6535/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920=
">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7334/shard-iclb8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658=
">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6535/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/=
shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6535/shard-kbl1/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl1/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6535/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6535/=
shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shar=
d-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7334/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7334/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_733=
4/shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6535 -&gt; IGTPW_7334</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11775: 93bea5a783b94aa5336606ddee482f659ccd9804 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7334: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7334/index.htm=
l<br />
  IGT_6535: c30662230963df6e6dba0f5df4792840b2feae85 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7669405049429718620==--
