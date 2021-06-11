Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 11 Jun 2021 15:05:46 -0000
Message-ID: <162342394624.29312.8301155299549455381@emeril.freedesktop.org>
References: <20210611052005.303-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210611052005.303-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C01/17=5D_tests/kms=5Fdither=3A_New_IG?=
 =?utf-8?q?T_to_validate_crtc_Dithering_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0906444089=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0906444089==
Content-Type: multipart/alternative;
 boundary="===============8840277921648435382=="

--===============8840277921648435382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev5)
URL   : https://patchwork.freedesktop.org/series/91371/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10212_full -> IGTPW_5912_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5912_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5912_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5912_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-tglb5/igt@gem_exec_whisper@basic-fds-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb2/igt@gem_exec_whisper@basic-fds-all.html

  * {igt@kms_addfb_basic@invalid-smem-bo-on-discrete} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * {igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * {igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * {igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][8] +10 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * {igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][9] +29 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a.html

  * {igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][10] +36 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10212_full and IGTPW_5912_full:

### New IGT tests (90) ###

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - Statuses : 5 fail(s)
    - Exec time: [0.01, 0.12] s

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.01, 2.04] s

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - Statuses : 6 pass(s)
    - Exec time: [1.02, 2.03] s

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - Statuses : 6 pass(s)
    - Exec time: [1.09, 2.17] s

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.12, 2.16] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.88] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - Statuses : 5 pass(s)
    - Exec time: [0.44, 1.35] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - Statuses : 4 fail(s) 2 pass(s)
    - Exec time: [0.08, 0.57] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses : 4 pass(s)
    - Exec time: [1.01, 1.91] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - Statuses : 5 pass(s)
    - Exec time: [0.45, 1.36] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.01, 1.46] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.04, 0.68] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses : 4 pass(s)
    - Exec time: [1.44, 2.11] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - Statuses : 6 pass(s)
    - Exec time: [0.69, 2.58] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.07, 1.55] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - Statuses : 4 fail(s) 2 pass(s)
    - Exec time: [0.04, 1.41] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - Statuses : 5 pass(s)
    - Exec time: [1.13, 2.05] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - Statuses : 4 pass(s)
    - Exec time: [1.05, 2.56] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.04, 1.60] s

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.02, 1.41] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.03] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 1.55] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.37] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.04, 0.74] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.18] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.51] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.51] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.04, 0.76] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses : 5 pass(s)
    - Exec time: [0.99, 2.10] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.76] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - Statuses : 2 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.43] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - Statuses : 3 fail(s) 2 pass(s)
    - Exec time: [0.07, 2.27] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - Statuses : 4 pass(s)
    - Exec time: [1.01, 2.11] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - Statuses : 3 fail(s) 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.39] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.90] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.07] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.43] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - Statuses : 3 fail(s) 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.87] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.89] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.24] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.28] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - Statuses : 2 fail(s) 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.76] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cdclk@basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cdclk@mode-transition:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cdclk@plane-scaling:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-16bpc-vs-panel-12bpc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-16bpc-vs-panel-12bpc@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.03, 0.08] s

  * igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.07] s

  * igt@kms_dither@fb-16bpc-vs-panel-12bpc@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.21] s

  * igt@kms_dither@fb-16bpc-vs-panel-12bpc@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.22] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.16, 0.21] s

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [1.15, 1.17] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.03] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.20] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.21] s

  * igt@kms_dp_dsc@basic-dsc-enable:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [1.49] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.15] s

  * igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5912_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#111827])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb8/igt@feature_discovery@chamelium.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][12] ([i915#3002])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl7/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][14] -> [TIMEOUT][15] ([i915#3063])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb8/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][16] ([i915#2846])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#2842]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          NOTRUN -> [FAIL][19] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          NOTRUN -> [FAIL][20] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-kbl3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl6/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#2849])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2389])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#307])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk9/igt@gem_mmap_gtt@big-copy-xy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk8/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#768])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109290])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3323])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109289])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb1/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#112306])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb7/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#112306])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#1937])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][39] ([i915#3462])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@i915_selftest@live@execlists.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * {igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][41] ([fdo#109052]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#2705])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb1/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#2705])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271]) +435 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb5/igt@kms_ccs@pipe-a-ccs-on-another-bo.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk6/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +26 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl6/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3116])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3116])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111828]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb1/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][56] ([i915#1319])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl4/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][57] ([i915#1319]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][58] -> [DMESG-WARN][59] ([i915#180])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271]) +81 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3359]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [fdo#109279])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3319])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278]) +10 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109279] / [i915#3359])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#67])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk5/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * {igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271]) +62 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk2/igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][70] -> [FAIL][71] ([i915#79])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109280]) +10 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#111825]) +9 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#1187])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@kms_hdr@static-toggle-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#1187]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#533]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][79] ([i915#265])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][80] ([i915#265])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111615]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-y:
    - shard-iclb:         [PASS][82] -> [FAIL][83] ([i915#1779])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-iclb7/igt@kms_plane_multiple@atomic-pipe-c-tiling-y.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IG

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html

--===============8840277921648435382==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,01/17] tests/kms_dither: New IGT to validate crtc Dithering (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91371/">https://patchwork.freedesktop.org/series/91371/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10212_full -&gt; IGTPW_5912_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5912_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5912_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5912_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-tglb5/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb2/igt@gem_exec_whisper@basic-fds-all.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_addfb_basic@invalid-smem-bo-on-discrete} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a.html">SKIP</a> +29 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888.html">SKIP</a> +36 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10212_full and IGTPW_5912_full:</p>
<h3>New IGT tests (90)</h3>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.01, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.01, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.02, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.09, 2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.12, 2.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.01, 1.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.44, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 4 fail(s) 2 pass(s)</li>
<li>Exec time: [0.08, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.01, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.45, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.01, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.04, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.44, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.69, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.07, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 4 fail(s) 2 pass(s)</li>
<li>Exec time: [0.04, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.13, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.05, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.04, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.02, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.60, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.04, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.04, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.99, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses : 2 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s)</li>
<li>Exec time: [0.07, 2.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.01, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 3 fail(s) 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 3 fail(s) 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 3 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses : 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 1 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 2 fail(s) 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@basic:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-12bpc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-12bpc@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-12bpc@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-12bpc@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-16bpc-vs-panel-12bpc@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.16, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.15, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-10bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-11bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-12bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-13bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-14bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-15bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-16bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-17bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-18bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-19bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-20bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-21bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-22bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-8bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@dsc-9bpp-compression-xrgb8888:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5912_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb8/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb8/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-kbl3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb8/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk9/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk8/igt@gem_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb1/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb7/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> ([i915#3462])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([fdo#109052]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb1/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb5/igt@kms_ccs@pipe-a-ccs-on-another-bo.html">SKIP</a> ([fdo#109271]) +435 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk6/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl6/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb1/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl4/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl1/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a> ([fdo#109271]) +81 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a> ([i915#3359]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109278]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk5/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">FAIL</a> ([i915#67])</li>
</ul>
</li>
<li>
<p>{igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk2/igt@kms_dp_dsc@dsc-23bpp-compression-xrgb8888.html">SKIP</a> ([fdo#109271]) +62 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-iclb3/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-glk9/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5912/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-y:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10212/shard-iclb7/igt@kms_plane_multiple@atomic-pipe-c-tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IG">FAIL</a> ([i915#1779])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8840277921648435382==--

--===============0906444089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0906444089==--
