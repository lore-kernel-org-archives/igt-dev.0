Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2443319854262180591=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Tue, 28 Jun 2022 12:29:55 -0000
Message-ID: <165641939539.14504.2098554227550972971@emeril.freedesktop.org>
References: <20220627184140.7529-1-swati2.sharma@intel.com>
In-Reply-To: <20220627184140.7529-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fflip=5Fscaled=5Fcrc=3A_New_tests_=28rev9=29?=
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

--===============2443319854262180591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_flip_scaled_crc: New tests (rev9)
URL   : https://patchwork.freedesktop.org/series/105148/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11815_full -> IGTPW_7403_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7403_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7403_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7403_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_hangman@engine-engine-error@rcs0:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk5/igt@i915_hangman@engine-engine-error@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk8/igt@i915_hangman@engine-engine-error@rcs0.html

  * igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
    - shard-iclb:         [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb5/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.html

  * {igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][5] +26 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglu-4/igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode} (NEW):
    - shard-glk:          NOTRUN -> [INCOMPLETE][6] +36 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk1/igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][7] +44 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb2/igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][8] +41 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb6/igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][9] +44 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode} (NEW):
    - shard-apl:          NOTRUN -> [INCOMPLETE][10] +45 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl1/igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][11] +25 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-dg1-15/igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][12] +65 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-4/igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_vblank@pipe-b-query-idle-hang:
    - {shard-dg1}:        [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-dg1-12/igt@kms_vblank@pipe-b-query-idle-hang.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-dg1-15/igt@kms_vblank@pipe-b-query-idle-hang.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - {shard-dg1}:        NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-dg1-15/igt@kms_vblank@pipe-c-query-idle-hang.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11815_full and IGTPW_7403_full:

### New IGT tests (217) ###

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.32] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.30] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.97] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.37] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.96] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.30, 1.62] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.04, 0.38] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.34] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.03, 2.69] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.32] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.04, 1.56] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 2.75] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.75] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.59] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.31] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.72] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.74] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.75] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 2.70] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.34] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.24] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.04, 1.53] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.04, 2.65] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.99] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 1.52] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 1.59] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.66] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.04, 0.35] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.34] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.37] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 2 skip(s)
    - Exec time: [0.30, 0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.87] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.30, 1.67] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.04, 2.69] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.03, 1.55] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.78] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.58] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.26] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 2.66] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 1.52] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 1.58] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.67] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 2.79] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.68] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.78] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 2 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 1.71] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.06, 2.68] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.52] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  

Known issues
------------

  Here are the changes found in IGTPW_7403_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         NOTRUN -> [TIMEOUT][16] ([i915#3063])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb3/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#4525]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][19] ([i915#6141])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb7/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb3/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#2842]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#2842]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#2842]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][29] ([i915#2842]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][30] ([i915#2842]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-iclb:         [PASS][31] -> [INCOMPLETE][32] ([i915#5498])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb1/igt@gem_exec_whisper@basic-queues-priority.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb7/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4613])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl3/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][38] ([i915#2658])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl8/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][39] ([i915#2658])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk3/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][41] ([i915#2658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb8/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][42] ([i915#2658])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl1/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-snb5/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +104 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl2/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][45] ([i915#4991])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl7/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@gem_userptr_blits@unsync-unmap.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#3297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][48] -> [DMESG-WARN][49] ([i915#5566] / [i915#716])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk8/igt@gen9_exec_parse@allowed-single.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2856])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@gen9_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#2527] / [i915#2856])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@gen9_exec_parse@batch-without-end.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#5286]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#5286]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-glk:          NOTRUN -> [FAIL][54] ([i915#1888] / [i915#5138])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111614]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111615])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111615] / [i915#3689]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#6095])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271]) +110 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278]) +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3689] / [i915#6095]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3689]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl2/igt@kms_chamelium@vga-hpd-after-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_chamelium@vga-hpd-after-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk9/igt@kms_chamelium@vga-hpd-after-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_chamelium@vga-hpd-after-suspend.html
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_chamelium@vga-hpd-after-suspend.html
    - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-snb5/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][73] ([i915#1319])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#4103])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#4103])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109274]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][78] -> [FAIL][79] ([i915#79])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][80] -> [DMESG-WARN][81] ([i915#180]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * {igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][82] ([i915#2575]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-dg1-17/igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * {igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode} (NEW):
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +104 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl1/igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-glk:          NOTRUN -> [FAIL][84] ([i915#1888] / [i915#2546])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][85] -> [FAIL][86] ([i915#1888] / [i915#2546])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109280] / [fdo#111825]) +9 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][88] ([fdo#109271]) +180 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109280]) +9 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][90] ([fdo#108145] / [i915#265])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([i915#5235]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#2920])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk9/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#111068] / [i915#658])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-kbl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#658])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][98] -> [SKIP][99] ([fdo#109441]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#5289])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#5289])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-glk:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#533])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk1/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#533])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-a-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#2530])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb7/igt@nouveau_crc@pipe-a-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#2530])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb1/igt@nouveau_crc@pipe-a-source-outp-inactive.html

  * igt@prime_nv_api@i915_nv_double_import:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109291]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@prime_nv_api@i915_nv_double_import.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109291]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@sysfs_clients@split-50:
    - shard-glk:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2994])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk9/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-snb:          [DMESG-WARN][109] ([i915#4528]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-snb6/igt@device_reset@unbind-reset-rebind.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-snb5/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [FAIL][111] ([i915#6268]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@bsd1:
    - {shard-dg1}:        [FAIL][113] ([i915#4883]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-dg1-12/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-dg1-17/igt@gem_ctx_persistence@legacy-engines-hostile@bsd1.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-glk:          [INCOMPLETE][115] -> [PASS][116] +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk3/igt@gem_ctx_persistence@smoketest.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk5/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [SKIP][117] ([i915#4525]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb8/igt@gem_exec_balancer@parallel.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][119] ([i915#2842]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][121] ([i915#2842]) -> [PASS][122] +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - {shard-rkl}:        [SKIP][123] ([i915#6251]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-5/igt@gem_exec_fence@basic-wait@bcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-4/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_set_tiling_vs_pwrite:
    - {shard-rkl}:        [SKIP][125] ([i915#3282]) -> [PASS][126] +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@relocations:
    - {shard-rkl}:        [SKIP][127] ([i915#3281]) -> [PASS][128] +6 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-2/igt@gem_userptr_blits@relocations.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-5/igt@gem_userptr_blits@relocations.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][129] ([i915#5566] / [i915#716]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-apl8/igt@gen9_exec_parse@allowed-single.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl1/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][131] ([fdo#109271]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - {shard-dg1}:        [SKIP][133] ([i915#1937]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-tglu}:       [WARN][135] -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - {shard-rkl}:        [SKIP][137] ([i915#1397]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [DMESG-WARN][139] ([i915#5591]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-tglb1/igt@i915_selftest@live@hangcheck.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs:
    - {shard-rkl}:        [SKIP][141] ([i915#1845] / [i915#4098]) -> [PASS][142] +16 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs.html

  * igt@kms_color@pipe-c-invalid-ctm-matrix-sizes:
    - {shard-rkl}:        [SKIP][143] ([i915#4070]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-1/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-4/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:
    - shard-glk:          [SKIP][145] ([fdo#109271]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk7/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:
    - {shard-rkl}:        [SKIP][147] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][148] +5 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][149] ([i915#180]) -> [PASS][150] +3 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - {shard-rkl}:        [SKIP][151] ([i915#1849] / [i915#4098]) -> [PASS][152] +13 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][153] ([i915#433]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [FAIL][155] ([i915#1188]) -> [PASS][156] +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - {shard-rkl}:        [SKIP][157] ([i915#4278]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-1/igt@kms_invalid_mode@zero-hdisplay.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_plane@plane-panning-bottom-right@pipe-b-planes:
    - {shard-rkl}:        [SKIP][159] ([i915#1849] / [i915#3558]) -> [PASS][160] +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right@pipe-b-planes.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right@pipe-b-planes.html

  * igt@kms_plane@plane-position-hole@pipe-b-planes:
    - {shard-rkl}:        [SKIP][161] ([i915#3558]) -> [PASS][162] +1 similar issue
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid:
    - {shard-rkl}:        [SKIP][163] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-y:
    - {shard-rkl}:        [SKIP][165] ([i915#1849] / [i915#3558] / [i915#4070]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [SKIP][167] ([i915#5176]) -> [PASS][168] +1 similar issue
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [SKIP][169] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][171] ([fdo#109441]) -> [PASS][172] +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@sprite_mmap_gtt:
    - {shard-rkl}:        [SKIP][173] ([i915#1072]) -> [PASS][174] +2 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-1/igt@kms_psr@sprite_mmap_gtt.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_psr@sprite_mmap_gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [SKIP][175] ([i915#5519]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-d-wait-busy-hang:
    - shard-tglb:         [SKIP][177] -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-tglb1/igt@kms_vblank@pipe-d-wait-busy-hang.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb3/igt@kms_vblank@pipe-d-wait-busy-hang.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - {shard-rkl}:        [SKIP][179] ([fdo#109289]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][181] ([i915#5784]) -> [TIMEOUT][182] ([i915#3063])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][183] ([i915#658]) -> [SKIP][184] ([i915#588])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-glk:          [SKIP][185] ([fdo#109271]) -> [SKIP][186] ([fdo#109271] / [i915#1888]) +1 similar issue
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-glk2/igt@i915_pm_rpm@modeset-lpsp.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-glk1/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          [FAIL][187] ([i915#1188]) -> [DMESG-WARN][188] ([i915#180])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][189] ([i915#2920]) -> [SKIP][190] ([i915#658])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][191] ([i915#2920]) -> [SKIP][192] ([fdo#111068] / [i915#658]) +1 similar issue
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][193], [FAIL][194], [FAIL][195]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][196], [FAIL][197]) ([i915#3002] / [i915#4312] / [i915#5257])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-apl4/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-apl4/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-apl8/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl4/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2851]: https://gitlab.freedesktop.org/drm/intel/issues/2851
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5498]: https://gitlab.freedesktop.org/drm/intel/issues/5498
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6543 -> IGTPW_7403
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11815: 500f24fcd69dcbfbbf2e602dbb7313efb955e96a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7403: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/index.html
  IGT_6543: 0463b607ed58ceede542f9bad6a9dad8d77d6f9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/index.html

--===============2443319854262180591==
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
ev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105148/">https://patchwork.freedesktop.org/series/105148/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7403/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11815_full -&gt; IGTPW_7403_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7403_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7403_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7403=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_hangman@engine-engine-error@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk5/igt@i915_hangman@engine-engine-error@rcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403=
/shard-glk8/igt@i915_hangman@engine-engine-error@rcs0.html">INCOMPLETE</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb5/igt@kms_cursor_legacy@cursor-vs-flip@varying-size=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7403/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip@varying-size.htm=
l">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs=
-upscaling@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglu-4/igt@kms_flip_scaled_crc@default-flip-=
32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</=
a> +26 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-up=
scaling@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk1/igt@kms_flip_scaled_crc@default-flip-32=
bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">INCOMPLETE<=
/a> +36 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upsca=
ling@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb2/igt@kms_flip_scaled_crc@default-flip-3=
2bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> +44 =
similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscalin=
g@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-iclb6/igt@kms_flip_scaled_crc@nn-flip-32bpp-=
yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> +41 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling=
@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_flip_scaled_crc@nn-flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> +44=
 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@=
pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-apl1/igt@kms_flip_scaled_crc@nn-flip-64bpp-l=
inear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> +45 =
similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscalin=
g@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-dg1-15/igt@kms_flip_scaled_crc@nn-flip-64bpp=
-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> +25 si=
milar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling} (=
NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-rkl-4/igt@kms_flip_scaled_crc@nn-flip-64bpp-=
ytile-to-32bpp-ytile-upscaling.html">SKIP</a> +65 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_vblank@pipe-b-query-idle-hang:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-dg1-12/igt@kms_vblank@pipe-b-query-idle-hang.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/s=
hard-dg1-15/igt@kms_vblank@pipe-b-query-idle-hang.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-idle-hang:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-dg1-15/igt@kms_vblank@pipe-c-query-idle-hang=
.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11815_full and IGTPW_7403_=
full:</p>
<h3>New IGT tests (217)</h3>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downsc=
aling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-dow=
nscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-ups=
caling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-ups=
caling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.30, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-ups=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downsc=
aling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.04, 0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-dow=
nscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-dow=
nscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-ups=
caling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-ups=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downs=
caling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downs=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upsca=
ling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upsca=
ling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rccc=
s-downscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rccc=
s-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.03, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rccc=
s-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rccc=
s-upscaling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rccc=
s-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.04, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downs=
caling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downs=
caling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downs=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-upsca=
ling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-upsca=
ling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-downscal=
ing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downsc=
aling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-downsc=
aling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downsc=
aling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downsc=
aling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilegen12rccc=
s-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilegen12rccc=
s-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.04, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-dow=
nscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-dow=
nscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.04, 2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downs=
caling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downs=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-downscaling:<=
/p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.04, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.30, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@=
pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.30, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@=
pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-dow=
nscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-dow=
nscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.04, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-ups=
caling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-ups=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.03, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-downscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-downscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@=
pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downs=
caling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downs=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 2.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-downscaling=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-downscaling=
:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 2 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-ups=
caling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilercccs-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilercccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 pass(s) 4 skip(s)</li>
<li>Exec time: [0.06, 2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7403_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb3/igt@gem_eio@in-flight-1us.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i91=
5#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/=
shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk7/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6141">=
i915#6141</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/s=
hard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb7/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/sh=
ard-iclb3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-a=
pl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-k=
bl6/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk1/igt@gem_exec_fair@basic-pace@rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-iclb7/igt@gem_exec_fair@basic-pace@vecs0.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/284=
2">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb1/igt@gem_exec_whisper@basic-queues-priority.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
03/shard-iclb7/igt@gem_exec_whisper@basic-queues-priority.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5498">i915#=
5498</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-apl7/igt@gem_lmem_swapping@heavy-verify-rando=
m-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-rand=
om-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb1/igt@gem_lmem_swapping@heavy-verify-rand=
om-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-kbl3/igt@gem_lmem_swapping@heavy-verify-rando=
m-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk1/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-apl8/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb2/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb8/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-apl2/igt@gem_pxp@create-regular-context-2.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +104 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-kbl7/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb6/igt@gem_userptr_blits@unsync-unmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3297=
">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb6/igt@gem_userptr_blits@unsync-unmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3297=
">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-=
glk2/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb5/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
856">i915#2856</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb5/igt@gen9_exec_parse@batch-without-end.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_big_fb@4-tiled-64bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk8/igt@kms_big_fb@linear-8bpp-rotate-180.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk6/igt@kms_ccs@pipe-b-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_ccs@pipe-b-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb7/igt@kms_ccs@pipe-c-crc-primary-basic-4=
_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-glk6/igt@kms_ccs@pipe-c-crc-sprite-planes-bas=
ic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) +110 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb6/igt@kms_ccs@pipe-d-crc-primary-rotatio=
n-180-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-apl2/igt@kms_chamelium@vga-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_chamelium@vga-hpd-after-suspend=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-glk9/igt@kms_chamelium@vga-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_chamelium@vga-hpd-after-suspend=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_chamelium@vga-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-snb5/igt@kms_chamelium@vga-hpd-after-suspend.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-kbl6/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb1/igt@kms_cursor_legacy@2x-long-cursor-v=
s-flip-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb7/igt@kms_cursor_legacy@short-busy-flip-b=
efore-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-iclb7/igt@kms_flip@2x-modeset-vs-vblank-race=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7403/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@c-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-=
kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-up=
scaling} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-dg1-17/igt@kms_flip_scaled_crc@default-flip-=
32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscali=
ng@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-kbl1/igt@kms_flip_scaled_crc@nn-flip-32bpp-y=
ftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)=
 +104 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-indfb-msflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-i=
ndfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7403/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +9 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-snb5/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +180 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb6/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7403/shard-iclb2/igt@kms_plane_scaling@planes-downscale-f=
actor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-glk9/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-kbl6/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shar=
d-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb6/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5289">i915#5289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb1/igt@kms_rotation_crc@primary-4-tiled-re=
flect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-glk1/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-kbl4/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-tglb7/igt@nouveau_crc@pipe-a-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-iclb1/igt@nouveau_crc@pipe-a-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-tglb5/igt@prime_nv_api@i915_nv_double_import=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-iclb2/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7403/shard-glk9/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-snb6/igt@device_reset@unbind-reset-rebind.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4528">i=
915#4528</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7403/shard-snb5/igt@device_reset@unbind-reset-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#626=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403=
/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@bsd1:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-dg1-12/igt@gem_ctx_persistence@legacy-engines-hostile@b=
sd1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4883">i915#4883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7403/shard-dg1-17/igt@gem_ctx_persistence@legacy-engines-host=
ile@bsd1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk3/igt@gem_ctx_persistence@smoketest.html">INCOMPLETE=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/s=
hard-glk5/igt@gem_ctx_persistence@smoketest.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb8/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/sha=
rd-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7403/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
403/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +2 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-5/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6251">i915#625=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403=
/shard-rkl-4/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-2/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard=
-rkl-5/igt@gem_set_tiling_vs_pwrite.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-2/igt@gem_userptr_blits@relocations.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/=
shard-rkl-5/igt@gem_userptr_blits@relocations.html">PASS</a> +6 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-apl8/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7403/shard-apl1/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl=
2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1937">=
i915#1937</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7403/shard-dg1-16/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WA=
RN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403=
/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397"=
>i915#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7403/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-tglb1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915=
#5591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7403/shard-tglb6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_r=
c_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_ccs@pipe-b-bad-aux-stride-y_=
tiled_gen12_rc_ccs.html">PASS</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-invalid-ctm-matrix-sizes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-1/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/407=
0">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7403/shard-rkl-4/igt@kms_color@pipe-c-invalid-ctm-matrix-sizes.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a=
-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7403/shard-glk7/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a=
-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt=
-ytiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_draw_crc@draw-meth=
od-xrgb2101010-mmap-gtt-ytiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7403/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-d=
p1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-b=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb=
565-draw-blt.html">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/sha=
rd-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7403/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-1/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#427=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403=
/shard-rkl-6/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-5/igt@kms_plane@plane-panning-bottom-right@pipe-b-p=
lanes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_plane@plane-panning-bottom-r=
ight@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7403/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-mid:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-m=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-=
constant-alpha-mid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-y:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/184=
9">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3558">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7403/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-ti=
ling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-iclb8/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.ht=
ml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#1=
09642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11106=
8">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7403/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
03/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-1/igt@kms_psr@sprite_mmap_gtt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-=
rkl-6/igt@kms_psr@sprite_mmap_gtt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7403/shard-iclb1/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-busy-hang:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-tglb1/igt@kms_vblank@pipe-d-wait-busy-hang.html">SKIP</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/sha=
rd-tglb3/igt@kms_vblank@pipe-d-wait-busy-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen12-oa-tlb-invalidate:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10928=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403=
/shard-rkl-4/igt@perf@gen12-oa-tlb-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-tglb2/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-t=
glb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/=
shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-glk2/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shar=
d-glk1/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i=
915#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7403/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7403/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11815/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7403/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11815/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11815/shard-apl4/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11815/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7403/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/shard-apl4/igt@runner@aborted.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002"=
>i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6543 -&gt; IGTPW_7403</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11815: 500f24fcd69dcbfbbf2e602dbb7313efb955e96a @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7403: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7403/index.htm=
l<br />
  IGT_6543: 0463b607ed58ceede542f9bad6a9dad8d77d6f9c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2443319854262180591==--
