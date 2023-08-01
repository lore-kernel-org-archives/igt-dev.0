Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1772000529086454420=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Tue, 01 Aug 2023 08:15:50 -0000
Message-ID: <169087775015.10128.1363321784139349038@emeril.freedesktop.org>
References: <20230728093449.950073-1-swati2.sharma@intel.com>
In-Reply-To: <20230728093449.950073-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRFNDIEZy?=
 =?utf-8?q?actional_BPP_Val_Support_=28rev7=29?=
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

--===============1772000529086454420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DSC Fractional BPP Val Support (rev7)
URL   : https://patchwork.freedesktop.org/series/117493/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13435_full -> IGTPW_9480_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9480_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9480_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): pig-kbl-iris 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9480_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-dg2:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-11/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_dsc@dsc-fractional-bpp (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-rkl:          NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-dg1:          NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-tglu:         NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_dsc@dsc-fractional-bpp.html
    - shard-mtlp:         NOTRUN -> [INCOMPLETE][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp.html

  * {igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-8bpc} (NEW):
    - shard-mtlp:         NOTRUN -> [FAIL][8] +79 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-6/igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-8bpc.html

  * {igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-yuyv} (NEW):
    - shard-tglu:         NOTRUN -> [FAIL][9] +95 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-yuyv.html

  * {igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb2101010} (NEW):
    - shard-rkl:          NOTRUN -> [FAIL][10] +47 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb2101010.html

  * {igt@kms_dsc@dsc-with-output-formats-with-bpc} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [TIMEOUT][12] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg2:          [SKIP][13] ([i915#4083]) -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-1/igt@gem_mmap_wc@read-write-distinct.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@gem_mmap_wc@read-write-distinct.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:
    - shard-dg2:          [SKIP][15] ([i915#5354]) -> [TIMEOUT][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-3/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13435_full and IGTPW_9480_full:

### New IGT tests (367) ###

  * igt@kms_dsc@dsc-basic@pipe-a-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-3:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp:
    - Statuses : 1 incomplete(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - Statuses : 1 incomplete(s) 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb16161616f-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb16161616f-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb16161616f-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb2101010-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb2101010-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb2101010-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xyuv8888-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xyuv8888-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xyuv8888-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-yuyv-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-yuyv-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-yuyv-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-edp-1-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-edp-1-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-edp-1-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-10bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-12bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-8bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-edp-1-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-edp-1-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-edp-1-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-10bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-12bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-8bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-edp-1-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-edp-1-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-edp-1-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-edp-1-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-edp-1-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-edp-1-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xrgb16161616f:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xrgb2101010:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xyuv8888:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb16161616f:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb2101010:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xyuv8888:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb2101010:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xyuv8888:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xrgb16161616f:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xrgb2101010:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xyuv8888:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-xrgb16161616f:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-xrgb2101010:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-xyuv8888:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb2101010:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xyuv8888:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xrgb16161616f:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xrgb2101010:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xyuv8888:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb2101010:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xyuv8888:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xrgb16161616f:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xrgb2101010:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xyuv8888:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-yuyv:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb16161616f:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb2101010:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xyuv8888:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-yuyv:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-2-ycbcr420-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-2-ycbcr420-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-2-ycbcr420-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-2-ycbcr420-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-2-ycbcr420-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-2-ycbcr420-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-10bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-12bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-8bpc:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-10bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-12bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-8bpc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-1-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-2-ycbcr420:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-1-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-2-ycbcr420:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-1-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-2-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-1-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-2-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr420:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9480_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8411])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][19] ([i915#6122])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@api_intel_bb@render-ccs.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#7456])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@debugfs_test@basic-hwmon.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#7701])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#8414]) +9 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#8414]) +12 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][24] -> [FAIL][25] ([i915#7742])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@drm_fdinfo@virtual-idle:
    - shard-rkl:          NOTRUN -> [FAIL][26] ([i915#7742])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html

  * igt@drm_mm@drm_mm_test:
    - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#8661])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-18/igt@drm_mm@drm_mm_test.html

  * igt@feature_discovery@chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#4854])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#658]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@feature_discovery@psr1.html

  * igt@feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@feature_discovery@psr2.html

  * igt@gem_basic@multigpu-create-close:
    - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#7697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-5/igt@gem_basic@multigpu-create-close.html

  * igt@gem_create@create-ext-set-pat:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#8562])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#1099]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][34] -> [FAIL][35] ([i915#7816]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][37] ([i915#7975] / [i915#8213])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-1us:
    - shard-mtlp:         [PASS][38] -> [ABORT][39] ([i915#8503])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-8/igt@gem_eio@in-flight-1us.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_await@wide-contexts:
    - shard-dg2:          [PASS][40] -> [TIMEOUT][41] ([i915#5892])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-7/igt@gem_exec_await@wide-contexts.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4036])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4812])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#2846])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-glk6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#2842])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][48] ([i915#2842])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [PASS][49] -> [FAIL][50] ([i915#2842])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [PASS][51] -> [FAIL][52] ([i915#2842])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-sync:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#3539])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fence@submit67:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4812])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-7/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3539] / [i915#4852]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#3539] / [i915#4852])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglu:         NOTRUN -> [SKIP][57] ([fdo#112283])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-10/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#3281]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3281])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3281]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3281]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         NOTRUN -> [ABORT][62] ([i915#7392] / [i915#8131])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4860])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#2190])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][65] -> [TIMEOUT][66] ([i915#5493])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#284])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4083]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4077]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4077]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4083]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3282]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3282])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][74] ([i915#2658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4270]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#4270]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4270])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3282]) +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@gem_readwrite@beyond-eob.html
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3282])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#8428]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#5190]) +7 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4079])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@gem_render_tiled_blits@basic.html

  * igt@gem_unfence_active_buffers:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#4879])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3297]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3297])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#3297])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-dg2:          [PASS][88] -> [FAIL][89] ([fdo#103375]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-7/igt@gem_workarounds@suspend-resume-context.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-dg1:          NOTRUN -> [SKIP][90] ([fdo#109289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([fdo#109289]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([fdo#109289]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#2856]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@gen9_exec_parse@bb-start-param.html
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#2856]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload:
    - shard-snb:          [PASS][96] -> [ABORT][97] ([i915#4528])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-snb2/igt@i915_module_load@reload.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb6/igt@i915_module_load@reload.html

  * igt@i915_pm_backlight@fade-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#7561])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-6/igt@i915_pm_backlight@fade-with-dpms.html

  * igt@i915_pm_dc@dc5-dpms-negative:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#8018])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@i915_pm_dc@dc5-dpms-negative.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][100] -> [SKIP][101] ([i915#4281])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#8399])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_lpsp@kms-lpsp:
    - shard-snb:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#1769])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb6/igt@i915_pm_lpsp@kms-lpsp.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#1902])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@i915_pm_lpsp@screens-disabled.html
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#1902])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-mtlp:         [PASS][106] -> [SKIP][107] ([fdo#109289] / [i915#8403])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-dg1:          [PASS][108] -> [FAIL][109] ([i915#3591])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-tglu:         [PASS][110] -> [FAIL][111] ([i915#7940])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-2/igt@i915_pm_rpm@cursor-dpms.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [PASS][112] -> [SKIP][113] ([i915#1397]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-rkl:          [PASS][114] -> [FAIL][115] ([i915#7940])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@gem-execbuf-stress@lmem0:
    - shard-dg1:          [PASS][116] -> [FAIL][117] ([i915#7940]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#1397])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][119] -> [SKIP][120] ([i915#1397]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-dg1:          NOTRUN -> [SKIP][121] ([fdo#109506])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#8925])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#6245])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-4/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-unsupported:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([fdo#109302])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-3/igt@i915_query@query-topology-unsupported.html
    - shard-rkl:          NOTRUN -> [SKIP][125] ([fdo#109302])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@i915_query@query-topology-unsupported.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4212])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3826])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#4212])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-5/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#8502] / [i915#8709]) +11 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html

  * igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [FAIL][130] ([i915#8247]) +3 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#404])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#404])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#1769] / [i915#3555])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#1769] / [i915#3555])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#5286]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5286])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-12/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][137] ([fdo#111615] / [i915#5286])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][138] -> [FAIL][139] ([i915#5138])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [PASS][140] -> [FAIL][141] ([i915#3743]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([fdo#111614]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][143] ([fdo#111614] / [i915#3638]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([fdo#111614]) +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][145] ([fdo#111615]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([fdo#110723])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([fdo#111615])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([fdo#111615]) +4 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#4538] / [i915#5190])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][150] ([i915#2705])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#3689] / [i915#5354]) +19 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#6095]) +14 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +2 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3689] / [i915#5354] / [i915#6095]) +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-14/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#5354] / [i915#6095]) +4 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#3886] / [i915#5354] / [i915#6095])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][160] ([i915#3886] / [i915#6095]) +2 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#5354] / [i915#6095]) +11 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#5354] / [i915#6095]) +1 similar issue
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#5354]) +13 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglu:         NOTRUN -> [SKIP][166] ([i915#3742])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([fdo#111827])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@kms_chamelium_color@gamma.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([fdo#111827])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#7828]) +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#7828]) +6 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#7828]) +2 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-6/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#7828]) +1 similar issue
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#7828]) +3 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#3299])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#7118]) +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@kms_content_protection@mei_interface.html
    - shard-rkl:          NOTRUN -> [SKIP][176] ([fdo#109300])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#7116])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3555]) +4 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3359]) +1 similar issue
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([fdo#109279] / [i915#3359])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#3555]) +1 similar issue
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#8814])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3359])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#3359])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#3555])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([fdo#109274] / [i915#5354]) +1 similar issue
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#4213])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3546]) +1 similar issue
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([fdo#111825]) +4 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([fdo#111825]) +5 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][192] -> [FAIL][193] ([i915#2346])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-mtlp:         [PASS][194] -> [DMESG-WARN][195] ([i915#2017])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#8812]) +1 similar issue
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html

  * {igt@kms_dsc@dsc-fractional-bpp-with-bpc} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][197] ([fdo#109271]) +2 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-apl1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * {igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-8bpc} (NEW):
    - shard-dg1:          NOTRUN -> [FAIL][198] ([i915#6121]) +95 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-17/igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-8bpc.html

  * {igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc} (NEW):
    - shard-dg2:          NOTRUN -> [FAIL][199] ([i915#6121]) +95 similar issues
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([fdo#109274]) +4 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3637]) +2 similar issues
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([fdo#109274] / [i915#3637]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#8381])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][204] -> [ABORT][205] ([i915#180])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][206] ([fdo#103375]) +1 similar issue
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#2587] / [i915#2672])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#2672])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#2672])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#2672]) +1 similar issue
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#2587] / [i915#2672]) +1 similar issue
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#8810])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          [PASS][213] -> [FAIL][214] ([i915#6880]) +2 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#8708]) +10 similar issues
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#5354]) +33 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#8708]) +3 similar issues
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3023]) +9 similar issues
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][219] ([fdo#110189]) +10 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([fdo#111825] / [i915#1825]) +17 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#8708]) +3 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#3458]) +13 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][223] ([fdo#109271]) +46 similar issues
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-glk6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#3458]) +2 similar issues
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][225] ([fdo#109271]) +256 similar issues
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#1825]) +14 similar issues
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([fdo#109280]) +12 similar issues
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [PASS][228] -> [SKIP][229] ([i915#433])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3555] / [i915#8228])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([fdo#109289])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#3582]) +3 similar issues
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#8806])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][234] ([i915#8292])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][235] ([i915#8292])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][236] ([i915#5176]) +3 similar issues
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#5176]) +7 similar issues
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#5176]) +3 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#5176]) +23 similar issues
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#5176]) +3 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#5235]) +3 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/index.html

--===============1772000529086454420==
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
<tr><td><b>Series:</b></td><td>DSC Fractional BPP Val Support (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117493/">https://patchwork.freedesktop.org/series/117493/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13435_full -&gt; IGTPW_9480_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9480_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9480_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/index.html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): pig-kbl-iris </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9480_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-11/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp (NEW):</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_dsc@dsc-fractional-bpp.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-8bpc} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-6/igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-8bpc.html">FAIL</a> +79 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-yuyv} (NEW):</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-yuyv.html">FAIL</a> +95 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb2101010} (NEW):</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb2101010.html">FAIL</a> +47 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-output-formats-with-bpc} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@prime_vgem@basic-write.html">TIMEOUT</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-1/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@gem_mmap_wc@read-write-distinct.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-3/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13435_full and IGTPW_9480_full:</p>
<h3>New IGT tests (367)</h3>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>Statuses : 1 incomplete(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>Statuses : 1 incomplete(s) 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-edp-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-2-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-a-hdmi-a-4-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-edp-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-2-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-edp-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-c-hdmi-a-4-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-edp-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-1-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb16161616f-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb16161616f-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb16161616f-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb2101010-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb2101010-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xrgb2101010-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xyuv8888-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xyuv8888-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-xyuv8888-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-yuyv-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-yuyv-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-4-yuyv-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-edp-1-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-edp-1-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-edp-1-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-10bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-12bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-1-8bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-a-hdmi-a-4-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-edp-1-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-edp-1-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-edp-1-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-10bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-12bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-1-8bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-b-hdmi-a-4-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-edp-1-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-edp-1-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-edp-1-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-1-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-c-hdmi-a-4-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-edp-1-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-edp-1-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-edp-1-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-1-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-3-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc@pipe-d-hdmi-a-4-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-a-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-xrgb2101010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-xyuv8888:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-2-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-b-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-c-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-xyuv8888:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-1-yuyv:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-xyuv8888:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats@pipe-d-hdmi-a-3-yuyv:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-1-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-2-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-2-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-2-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-a-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-1-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-2-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-2-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-2-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-b-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-1-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-c-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-1-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-10bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-12bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc@pipe-d-hdmi-a-3-ycbcr420-8bpc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-1-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-2-ycbcr420:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-a-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-1-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-2-ycbcr420:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-b-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-1-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-2-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-c-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-1-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-2-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats@pipe-d-hdmi-a-3-ycbcr420:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9480_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-2/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#7456])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@drm_fdinfo@busy-check-all@vecs1.html">SKIP</a> ([i915#8414]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm_test:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-18/igt@drm_mm@drm_mm_test.html">SKIP</a> ([i915#8661])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@feature_discovery@psr1.html">SKIP</a> ([i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-2/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> ([i915#7816]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-8/igt@gem_eio@in-flight-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@gem_eio@in-flight-1us.html">ABORT</a> ([i915#8503])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_await@wide-contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-7/igt@gem_exec_await@wide-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@gem_exec_await@wide-contexts.html">TIMEOUT</a> ([i915#5892])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_exec_balancer@sliced.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-7/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-10/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@gem_exec_reloc@basic-concurrent0.html">SKIP</a> ([i915#3281]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@gem_exec_reloc@basic-cpu-wc.html">SKIP</a> ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@gem_exec_reloc@basic-wc.html">SKIP</a> ([i915#3281]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@gem_exec_reloc@basic-write-gtt.html">SKIP</a> ([i915#3281]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-7/igt@gem_exec_whisper@basic-contexts-forked-all.html">ABORT</a> ([i915#7392] / [i915#8131])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html">SKIP</a> ([i915#4077]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282]) +4 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#8428]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#5190]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-7/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gem_workarounds@suspend-resume-context.html">FAIL</a> ([fdo#103375]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-snb2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb6/igt@i915_module_load@reload.html">ABORT</a> ([i915#4528])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-6/igt@i915_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@i915_pm_dc@dc5-dpms-negative.html">SKIP</a> ([i915#8018])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb6/igt@i915_pm_lpsp@kms-lpsp.html">SKIP</a> ([fdo#109271] / [i915#1769])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@i915_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#1902])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> ([fdo#109289] / [i915#8403])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> ([i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-2/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@i915_pm_rpm@cursor-dpms.html">FAIL</a> ([i915#7940])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg1-13/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html">FAIL</a> ([i915#7940])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg1-13/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@lmem0.html">FAIL</a> ([i915#7940]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-rkl-6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925])</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-4/igt@i915_query@hwconfig_table.html">SKIP</a> ([i915#6245])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-3/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-5/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-mc_ccs.html">SKIP</a> ([i915#8502] / [i915#8709]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#8247]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> ([i915#5286]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-12/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> ([i915#3743]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614] / [i915#3638]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([i915#4538] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#6095]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-6/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-14/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#5354] / [i915#6095])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3886] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#5354]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@kms_ccs@pipe-d-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@kms_chamelium_color@gamma.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-2/igt@kms_chamelium_color@gamma.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> ([i915#7828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-6/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> ([i915#7828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> ([i915#7828]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@kms_content_protection@mei_interface.html">SKIP</a> ([i915#7118]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-7/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7116])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> ([i915#3555]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([i915#3359]) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#8814])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#3359])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-10/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [i915#5354]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([i915#3546]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-15/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> ([fdo#111825]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> ([fdo#111825]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> ([i915#2017])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-fractional-bpp-with-bpc} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-apl1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([fdo#109271]) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-8bpc} (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-17/igt@kms_dsc@dsc-with-bpc-formats@pipe-b-hdmi-a-4-xyuv8888-8bpc.html">FAIL</a> ([i915#6121]) +95 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_dsc@dsc-with-bpc-formats@pipe-d-hdmi-a-3-xrgb16161616f-12bpc.html">FAIL</a> ([i915#6121]) +95 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-5/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> ([fdo#109274] / [i915#3637]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">ABORT</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">FAIL</a> ([fdo#103375]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> ([i915#6880]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([i915#5354]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3023]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#110189]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-glk6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> ([i915#3458]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +256 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13435/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-3/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html">SKIP</a> ([i915#3582]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-14/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-d-edp-1.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5176]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-75@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#5176]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9480/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@p</p>
</li>
</ul>

</body>
</html>

--===============1772000529086454420==--
