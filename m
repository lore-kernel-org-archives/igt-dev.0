Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0483499841666518952=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 29 Jun 2022 13:11:22 -0000
Message-ID: <165650828210.23234.5011491917353365752@emeril.freedesktop.org>
References: <20220628184304.19496-1-swati2.sharma@intel.com>
In-Reply-To: <20220628184304.19496-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_tests/i915/kms=5Fflip=5Fscaled?=
 =?utf-8?q?=5Fcrc=3A_Convert_tests_to_dynamic?=
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

--===============0483499841666518952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] tests/i915/kms_flip_scaled_crc: Convert tests to dynamic
URL   : https://patchwork.freedesktop.org/series/105741/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11820_full -> IGTPW_7430_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7430_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7430_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7430_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * {igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +44 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * {igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode} (NEW):
    - shard-glk:          NOTRUN -> [INCOMPLETE][4] +44 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk2/igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][5] +34 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglu-1/igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][6] +46 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode} (NEW):
    - shard-apl:          NOTRUN -> [INCOMPLETE][7] +44 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl7/igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][8] +44 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl3/igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][9] +27 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-dg1-19/igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * {igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][10] +62 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-rkl-1/igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - {shard-rkl}:        NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@i915_pm_rpm@gem-execbuf@lmem0:
    - {shard-dg1}:        NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf@lmem0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11820_full and IGTPW_7430_full:

### New IGT tests (210) ###

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.02, 0.45] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.31] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 2.99] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 2 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.31] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.96] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.36] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.25] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 skip(s)
    - Exec time: [0.0, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.32, 1.66] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.04, 2.68] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.79] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.70] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.58] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.35] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.31] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.36] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.31] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.32] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.34] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.87] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 1.96] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 2.69] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.59] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.30] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.29] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.63] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.11] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 2.88] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.63] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.04, 2.65] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.98] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 3.01] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.62] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.77] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.62] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 skip(s)
    - Exec time: [0.0, 0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.32] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.04, 0.44] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.35] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.06, 0.37] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 2 skip(s)
    - Exec time: [0.30, 0.32] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.03, 0.45] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.31, 2.79] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.70] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.04, 2.71] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 1 pass(s) 4 skip(s)
    - Exec time: [0.04, 1.56] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.74] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.57] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 6 skip(s)
    - Exec time: [0.02, 0.35] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.30] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 4 skip(s)
    - Exec time: [0.03, 0.45] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.77] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.65] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.77] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.60] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [2.73] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 2.65] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 2 pass(s)
    - Exec time: [0.0, 1.67] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.89] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 1.69] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.03, 0.32] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - Statuses : 7 skip(s)
    - Exec time: [0.02, 0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-default-mode:
    - Statuses : 2 skip(s)
    - Exec time: [0.30, 0.31] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - Statuses : 5 skip(s)
    - Exec time: [0.03, 0.33] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [1.26] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 2.71] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 1.55] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 2.87] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - Statuses : 3 incomplete(s) 4 pass(s)
    - Exec time: [0.0, 1.61] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - Statuses : 1 skip(s)
    - Exec time: [0.35] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.03, 1.54] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.06, 2.66] s

  

Known issues
------------

  Here are the changes found in IGTPW_7430_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#1839])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@feature_discovery@display-4x.html
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#1839])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1099]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-snb7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-iclb:         [PASS][17] -> [TIMEOUT][18] ([i915#3070])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb1/igt@gem_eio@in-flight-contexts-1us.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#4525])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#6117])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@gem_exec_balancer@parallel-ordering.html
    - shard-kbl:          NOTRUN -> [FAIL][22] ([i915#6117])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#2842]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#2842]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109283])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@gem_exec_params@no-bsd.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109283])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#112283])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb8/igt@gem_exec_params@secure-non-root.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#112283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@gem_exec_params@secure-non-root.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb7/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@gem_lmem_swapping@parallel-random-engines.html
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#4613])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk9/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#4613]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][42] ([i915#2658])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl3/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-snb4/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][45] ([i915#2658])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk8/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][46] ([i915#2658])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb7/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl6/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#4270]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb5/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#4270]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#3297])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@gem_userptr_blits@access-control.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3297])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb6/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@huge-split:
    - shard-tglb:         [PASS][52] -> [FAIL][53] ([i915#3376])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb2/igt@gem_userptr_blits@huge-split.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@gem_userptr_blits@huge-split.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#2527] / [i915#2856]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb5/igt@gen9_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#2856])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#454])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][57] ([i915#454])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
    - shard-kbl:          NOTRUN -> [FAIL][58] ([i915#454])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109289]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109506] / [i915#2411])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_query@hwconfig_table:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#6245])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb6/igt@i915_query@hwconfig_table.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#1769])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#5286]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#5286]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#110725] / [fdo#111614])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111614])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110723]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#6095])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +6 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271]) +223 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#111615] / [i915#3689]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3689] / [i915#6095]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#3886]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk3/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278] / [i915#3886]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278]) +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3689])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-crc-multiple:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk3/igt@kms_chamelium@hdmi-crc-multiple.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@kms_chamelium@hdmi-crc-multiple.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-snb:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-snb6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][86] ([i915#1319])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109274]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#3528])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#3528])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#5287])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#5287]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          NOTRUN -> [FAIL][92] ([i915#4767])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109274] / [fdo#111825]) +5 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [PASS][94] -> [DMESG-WARN][95] ([i915#180]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][96] -> [INCOMPLETE][97] ([i915#3614] / [i915#794])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
    - shard-glk:          [PASS][98] -> [FAIL][99] ([i915#2122]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk8/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk5/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html

  * {igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271]) +119 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk6/igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#109280] / [fdo#111825]) +17 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([fdo#109280]) +12 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [PASS][103] -> [FAIL][104] ([i915#1188])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][105] ([fdo#108145] / [i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          NOTRUN -> [FAIL][107] ([fdo#108145] / [i915#265])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][108] ([i915#265])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-dp-1:
    - shard-kbl:          NOTRUN -> [SKIP][109] ([fdo#109271]) +181 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-dp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#5176]) +7 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#5176]) +5 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([i915#5235]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#658]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#2920]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#658]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#111068] / [i915#658]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#658]) +4 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][119] -> [SKIP][120] ([fdo#109642] / [fdo#111068] / [i915#658])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109441])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][122] ([i915#132] / [i915#3467])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [PASS][123] -> [SKIP][124] ([i915#5519])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([i915#3555]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-tglb:         NOTRUN -> [SKIP][126] ([i915#3555]) +3 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb6/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2437])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl2/igt@kms_writeback@writeback-fb-id.html

  * igt@perf_pmu@enable-race@rcs0:
    - shard-glk:          [PASS][128] -> [DMESG-WARN][129] ([i915#118])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk3/igt@perf_pmu@enable-race@rcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk1/igt@perf_pmu@enable-race@rcs0.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([fdo#109291]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][131] ([fdo#109271]) +194 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-snb6/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([fdo#109291]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@prime_vgem@coherency-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#109292] / [fdo#109295])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@prime_vgem@coherency-gtt.html
    - shard-tglb:         NOTRUN -> [SKIP][134] ([fdo#109295] / [fdo#111656])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@create:
    - shard-kbl:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#2994])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl3/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][136] ([i915#2994])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@sysfs_clients@create.html

  * igt@sysfs_clients@recycle:
    - shard-apl:          NOTRUN -> [SKIP][137] ([fdo#109271] / [i915#2994]) +2 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl4/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-25:
    - shard-glk:          NOTRUN -> [SKIP][138] ([fdo#109271] / [i915#2994])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk1/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@dumb_buffer@create-clear:
    - shard-kbl:          [INCOMPLETE][139] -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl6/igt@dumb_buffer@create-clear.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl6/igt@dumb_buffer@create-clear.html

  * igt@gem_ctx_persistence@hostile:
    - shard-tglb:         [FAIL][141] ([i915#2410]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb2/igt@gem_ctx_persistence@hostile.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@gem_ctx_persistence@hostile.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [SKIP][143] ([i915#4525]) -> [PASS][144] +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb7/igt@gem_exec_balancer@parallel.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][145] ([i915#2842]) -> [PASS][146] +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][147] ([i915#2842]) -> [PASS][148] +3 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_schedule@preempt-hang@vcs0:
    - shard-glk:          [INCOMPLETE][149] ([i915#6310]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk8/igt@gem_exec_schedule@preempt-hang@vcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk7/igt@gem_exec_schedule@preempt-hang@vcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][151] ([i915#180]) -> [PASS][152] +4 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][153] ([i915#5566] / [i915#716]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@gen9_exec_parse@allowed-single.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl3/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][155] ([i915#454]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-glk:          [FAIL][157] ([i915#3743]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][159] ([i915#79]) -> [PASS][160] +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [FAIL][161] ([i915#1188]) -> [PASS][162] +1 similar issue
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [SKIP][163] ([i915#5235]) -> [PASS][164] +5 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][165] ([fdo#109441]) -> [PASS][166] +2 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][167] ([i915#5519]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-snb:          [SKIP][169] ([fdo#109271]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][171] ([i915#6117]) -> [SKIP][172] ([i915#4525])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][173] ([i915#2842]) -> [FAIL][174] ([i915#2852])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@kms_content_protection@mei_interface:
    - shard-tglb:         [SKIP][175] ([i915#1063]) -> [SKIP][176] ([fdo#109300])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-tglb3/igt@kms_content_protection@mei_interface.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_content_protection@mei_interface.html
    - shard-iclb:         [SKIP][177] ([fdo#109300] / [fdo#111066]) -> [SKIP][178] ([fdo#109300])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_content_protection@mei_interface.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_content_protection@mei_interface.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][179] ([i915#2920]) -> [SKIP][180] ([fdo#111068] / [i915#658])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-iclb:         [SKIP][181] ([i915#658]) -> [SKIP][182] ([i915#2920])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][183] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][184] ([i915#5939])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188], [FAIL][189], [FAIL][190], [FAIL][191]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl8/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl1/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl1/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl2/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl8/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl4/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl4/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl2/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][197], [FAIL][198], [FAIL][199]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][200], [FAIL][201]) ([i915#3002] / [i915#4312] / [i915#5257])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl3/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl1/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109292]: https://bugs.freedesktop.org/show_bug.cgi?id=109292
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
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
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6141]: https://gitlab.freedesktop.org/drm/intel/issues/6141
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6310]: https://gitlab.freedesktop.org/drm/intel/issues/6310
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6549 -> IGTPW_7430
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/index.html
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/index.html

--===============0483499841666518952==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] tests/i915/=
kms_flip_scaled_crc: Convert tests to dynamic</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105741/">https://patchwork.freedesktop.org/series/105741/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7430/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11820_full -&gt; IGTPW_7430_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7430_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7430_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/index.=
html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7430=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_cursor_legacy@flip-vs-curs=
or@atomic-transitions-varying-size.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-do=
wnscaling@pipe-a-default-mode} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_flip_scaled_crc@default-flip-3=
2bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</=
a> +44 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-up=
scaling@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-glk2/igt@kms_flip_scaled_crc@default-flip-32=
bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">INCOMPLETE<=
/a> +44 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs=
-upscaling@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglu-1/igt@kms_flip_scaled_crc@default-flip-=
64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</=
a> +34 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pi=
pe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_flip_scaled_crc@nn-flip-64bpp-=
4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> +46 similar=
 issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-32bpp-linear-upscaling@=
pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl7/igt@kms_flip_scaled_crc@nn-flip-64bpp-l=
inear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> +44 =
similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-32bpp-xtile-upscaling@pi=
pe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-kbl3/igt@kms_flip_scaled_crc@nn-flip-64bpp-x=
tile-to-32bpp-xtile-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> +44 si=
milar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscalin=
g@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-dg1-19/igt@kms_flip_scaled_crc@nn-flip-64bpp=
-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> +27 si=
milar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytile-upscaling} (=
NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-rkl-1/igt@kms_flip_scaled_crc@nn-flip-64bpp-=
ytile-to-32bpp-ytile-upscaling.html">SKIP</a> +62 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-rkl-5/igt@gem_render_copy@yf-tiled-to-vebox-=
x-tiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf@lmem0:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf@lmem0.htm=
l">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11820_full and IGTPW_7430_=
full:</p>
<h3>New IGT tests (210)</h3>
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
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.02, 0.45] s</li>
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
upscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
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
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-4tile-to-64bpp-4tile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
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
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 2.99] s</li>
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
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-linear-to-64bpp-linear-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-xtile-to-64bpp-xtile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-dow=
nscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-dow=
nscaling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-dow=
nscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-32bpp-yftileccs-ups=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downsc=
aling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftile-to-64bpp-yftile-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.35] s</li>
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
<li>Exec time: [0.03, 0.36] s</li>
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
<li>Exec time: [0.03, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-ups=
caling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-ups=
caling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-yftileccs-to-64bpp-yftile-ups=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.35] s</li>
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
caling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-downs=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upsca=
ling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upsca=
ling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.32, 1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytileccs-upsca=
ling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
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
<li>Exec time: [0.04, 2.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-32bpp-ytilegen12rccc=
s-upscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytile-to-64bpp-ytile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.79] s</li>
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
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downs=
caling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-32bpp-ytileccs-to-64bpp-ytile-downs=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.70] s</li>
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
<li>Exec time: [0.0, 1.58] s</li>
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
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.35] s</li>
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
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.36] s</li>
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
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
downscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-=
upscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downsc=
aling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-16bpp-linear-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
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
<li>Exec time: [0.0, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-linear-to-32bpp-linear-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscal=
ing:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 2.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscalin=
g:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-16bpp-xtile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-downscal=
ing:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-xtile-to-32bpp-xtile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downsc=
aling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-16bpp-yftile-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.30] s</li>
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
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-yftile-to-32bpp-yftile-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
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
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscal=
ing:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.63] s</li>
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
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-16bpp-ytile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.11] s</li>
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
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilegen12rccc=
s-upscaling:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-dow=
nscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@default-flip-64bpp-ytile-to-32bpp-ytilercccs-dow=
nscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
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
<li>Exec time: [0.03, 0.32] s</li>
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
ling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
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
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-64bpp-4tile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.98] s</li>
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
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-linear-to-64bpp-linear-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-downscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-xtile-to-64bpp-xtile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 3.01] s</li>
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
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
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
<li>Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.77] s</li>
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
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-32bpp-yftileccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.04, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftile-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
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
ing@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.06, 0.37] s</li>
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
<li>Exec time: [0.30, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-yftileccs-to-64bpp-yftile-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.03, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscalin=
g:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.31, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-downscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@=
pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-dow=
nscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-dow=
nscaling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.04, 2.71] s</li>
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
<li>Statuses : 1 pass(s) 4 skip(s)</li>
<li>Exec time: [0.04, 1.56] s</li>
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
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Statuses : 3 incomplete(s) 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.74] s</li>
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
<li>Exec time: [0.0, 1.57] s</li>
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
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
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
<li>Exec time: [0.02, 0.35] s</li>
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
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.30] s</li>
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
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upsca=
ling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.03, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-linear-to-16bpp-linear-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
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
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.77] s</li>
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
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-xtile-to-16bpp-xtile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 2.65] s</li>
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
<li>Statuses : 3 incomplete(s) 2 pass(s)</li>
<li>Exec time: [0.0, 1.67] s</li>
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
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 2.89] s</li>
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
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-downscaling=
:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.03, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-16bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.02, 0.31] s</li>
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
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.30, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-yftile-to-32bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.03, 0.33] s</li>
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
ipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-16bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>Statuses : 3 incomplete(s) 1 pass(s)</li>
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
<li>Exec time: [0.0, 2.87] s</li>
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
<li>Statuses : 3 incomplete(s) 4 pass(s)</li>
<li>Exec time: [0.0, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-ups=
caling:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-ups=
caling@pipe-a-default-mode:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@nn-flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-ups=
caling@pipe-a-valid-mode:</p>
<ul>
<li>Statuses : 3 pass(s) 3 skip(s)</li>
<li>Exec time: [0.03, 1.54] s</li>
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
<li>Exec time: [0.06, 2.66] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7430_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb2/igt@feature_discovery@display-4x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb1/igt@feature_discovery@display-4x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-snb7/igt@gem_ctx_persistence@hang.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10=
99">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb1/igt@gem_eio@in-flight-contexts-1us.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard=
-iclb5/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3070">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/=
shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb7/igt@gem_exec_balancer@parallel-ordering=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6117">i915#6117</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6117">i915#6117</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11820/shard-tglb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/s=
hard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11820/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/sh=
ard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 si=
milar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-k=
bl4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-=
iclb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb6/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb1/igt@gem_exec_params@no-bsd.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb8/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb2/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-tglb6/ig=
t@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb7/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-kbl4/igt@gem_lmem_swapping@parallel-random-en=
gines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb3/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-glk9/igt@gem_lmem_swapping@parallel-random-en=
gines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl7/igt@gem_lmem_swapping@parallel-random-v=
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
tree/drm-tip/IGTPW_7430/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-snb4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-glk8/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb7/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-kbl6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb5/igt@gem_pxp@display-protected-crc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270=
">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@gem_pxp@verify-pxp-stale-buf-optou=
t-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb1/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb6/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb2/igt@gem_userptr_blits@huge-split.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-t=
glb1/igt@gem_userptr_blits@huge-split.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3376">i915#3376</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb5/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb5/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a=
>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb6/igt@i915_query@hwconfig_table.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6245">i9=
15#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@kms_big_fb@4-tiled-addfb-size-over=
flow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb8/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_big_fb@linear-64bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D110723">fdo#110723</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl2/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +223 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_ccs@pipe-b-bad-aux-stride-yf_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl7/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-glk3/igt@kms_ccs@pipe-c-bad-pixel-format-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-multiple:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-glk3/igt@kms_chamelium@hdmi-crc-multiple.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb6/igt@kms_chamelium@hdmi-crc-multiple.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
84">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@kms_color_chamelium@pipe-a-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-snb6/igt@kms_color_chamelium@pipe-b-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_color_chamelium@pipe-d-degamma=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl4/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb1/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb21010=
10-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb8888-=
render-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i91=
5#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_flip@2x-plain-flip.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#=
109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
25">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7430/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7430/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
614">i915#3614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/794">i915#794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk8/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7430/shard-glk5/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#21=
22</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_flip_scaled_crc@nn-flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upsc=
aling@pipe-a-valid-mode} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-glk6/igt@kms_flip_scaled_crc@nn-flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a>) +119 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +17 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-=
kbl1/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-d=
p-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@kms_plane_scaling@plane-downscale-w=
ith-rotation-factor-0-25@pipe-b-dp-1.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +181 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_plane_scaling@plane-downscale-=
with-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_plane_scaling@plane-scaler-wit=
h-clipping-clamping-rotation@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb1/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-5@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_plane_scaling@plan=
es-upscale-20x20-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb3/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard=
-iclb3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb1/igt@kms_psr@psr2_primary_mmap_cpu.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">=
i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
467">i915#3467</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7430/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb5/igt@kms_setmode@basic-clone-single-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb6/igt@kms_setmode@basic-clone-single-crtc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl2/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk3/igt@perf_pmu@enable-race@rcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-glk1/=
igt@perf_pmu@enable-race@rcs0.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-tglb2/igt@prime_nv_api@i915_nv_import_twice.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-snb6/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +194 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-iclb1/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109292">fdo=
#109292</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
295">fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb7/igt@prime_vgem@coherency-gtt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo=
#109295</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
656">fdo#111656</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-kbl3/igt@sysfs_clients@create.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7430/shard-tglb2/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-apl4/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7430/shard-glk1/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@dumb_buffer@create-clear:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl6/igt@dumb_buffer@create-clear.html">INCOMPLETE</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-=
kbl6/igt@dumb_buffer@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb2/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/sh=
ard-tglb3/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb7/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/sha=
rd-iclb2/igt@gem_exec_balancer@parallel.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/=
shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
430/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +3 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-hang@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk8/igt@gem_exec_schedule@preempt-hang@vcs0.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6310=
">i915#6310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7430/shard-glk7/igt@gem_exec_schedule@preempt-hang@vcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl4/igt@gem_workarounds@suspend-resume-context.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7430/shard-apl8/igt@gem_workarounds@suspend-resume-context.html">PAS=
S</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl3/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7430/shard-kbl3/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb5/i=
gt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
0-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7430/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-=
hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7430/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdm=
i-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915=
#1188</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7430/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-iclb6/igt@kms_plane_scalin=
g@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">PASS</a> +5 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430=
/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7430/shard-tglb5/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7430/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7430/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7430/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915#2852</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11820/shard-tglb3/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i91=
5#1063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7430/shard-tglb1/igt@kms_content_protection@mei_interface.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10930=
0</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11820/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fd=
o#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1066">fdo#111066</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7430/shard-iclb2/igt@kms_content_protection@mei_interface.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300"=
>fdo#109300</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7430/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7430/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg=
-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7430/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11820/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11820/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-apl4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1820/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430=
/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl4/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-=
apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7430/shard-apl2/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-apl7/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11820/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11820/shard-kbl4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11820/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">=
i915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7430/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6549 -&gt; IGTPW_7430</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11820: 8f4a9176de36698b5b3ba72c4f68f1cf7a15c0c9 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7430: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7430/index.htm=
l<br />
  IGT_6549: 9b9371c8da32533022ad700a7c023b4c3a085fbc @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0483499841666518952==--
