Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6699461489618525041=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Tue, 14 Jun 2022 16:00:11 -0000
Message-ID: <165522241185.12483.10501771249721191862@emeril.freedesktop.org>
References: <20220610085711.4087880-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220610085711.4087880-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_IGT_test_cleanup?=
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

--===============6699461489618525041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: IGT test cleanup
URL   : https://patchwork.freedesktop.org/series/104971/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11752_full -> IGTPW_7277_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7277_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][1] +47 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x10} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][2] +63 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x10.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +59 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb3/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][4] +79 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb5/igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_3d:
    - {shard-dg1}:        [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-dg1-19/igt@kms_3d.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_3d.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - {shard-dg1}:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - {shard-dg1}:        [SKIP][8] ([i915#3689]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-dg1-13/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_cursor_legacy@pipe-b-single-bo:
    - {shard-dg1}:        NOTRUN -> [WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_cursor_legacy@pipe-b-single-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
    - {shard-dg1}:        NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11752_full and IGTPW_7277_full:

### New IGT tests (732) ###

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.50] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.67] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.21, 0.89] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.55] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.43] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.22, 0.57] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.55] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.47] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.22, 0.57] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.32] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.40, 0.50] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.65, 1.21] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.20, 0.84] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.51] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.42, 1.70] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.19, 0.55] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.49, 1.71] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.20, 0.53] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.60] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.32] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.48, 2.67] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.74] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.61] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.24, 2.96] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.65, 3.35] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.51] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.49] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [1.21, 2.50] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [1.21, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.50] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.33] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.34] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.48, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.46, 2.57] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.65, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.50] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.51] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.20, 2.50] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.42] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.42] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.42] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.40] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.74, 2.95] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.63] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.84, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.13, 3.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.39] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.79, 3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 3.44] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.32] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.05, 3.38] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.80] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.70, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.80, 3.66] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.66] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.80, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.80, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.77, 3.30] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.77, 3.28] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.76, 3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.79, 3.35] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.06] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.77, 3.28] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.28] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.58] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.75, 2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.74, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.73, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.63] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.84, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.78, 3.46] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.79, 3.30] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.32] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.08] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.85, 3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.84, 3.36] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.37] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.29] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.38] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.58, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.54, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.54, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.48, 4.58] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.53] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.27, 4.71] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.72] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [2.27, 5.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [2.27, 5.89] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.07] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.77] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [2.27, 5.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.41] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.58, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.68] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.68] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [2.25, 5.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [2.27, 5.76] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.75] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [2.25, 5.86] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.69] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.45] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [2.25, 5.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [2.25, 5.79] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.77] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [2.25, 5.84] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [2.26, 5.85] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [2.25, 5.88] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 5.81] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 5.72] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 5.86] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 5.78] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 5.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 5.79] s

  * igt@kms_cursor_crc@cursor-rapid-movement:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.49] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.50] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.54] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.54] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.46] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.35] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.38] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.54] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.54] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.54] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.32, 0.79] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.35] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.31] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.35] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.48] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.48] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.33] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.33] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.49] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.48] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.07] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [1.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.69] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.85] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.30, 1.05] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.73] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.60] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.29, 0.74] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.73] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.61] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-hdmi-a-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.28, 0.71] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-d-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.56] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.39, 4.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.39, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.37, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.37, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.31, 4.43] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 5.33] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.92, 5.30] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [3.96, 5.30] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [3.94, 5.29] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.16, 4.56] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.75] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.36, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [3.94, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.94, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [3.94, 5.29] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 5.29] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-256x85:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-64x21:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.25] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.37, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.40, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.37, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.41, 4.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 5.33] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [3.92, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 5.29] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.07] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.90] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.93] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.0, 3.59] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.93] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.82] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.52] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.92, 3.91] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.37, 5.57] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.79] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.28] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.01, 3.84] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [5.67, 6.84] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.50] s

  

Known issues
------------

  Here are the changes found in IGTPW_7277_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#658])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-snb6/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [PASS][14] -> [TIMEOUT][15] ([i915#3063])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb6/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4525])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb8/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#4525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2842]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#2842]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#2849])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#118])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk3/igt@gem_exec_whisper@basic-fds-forked-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#4270])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb5/igt@gem_pxp@create-regular-context-2.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#4270])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb8/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271]) +92 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#768])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][39] ([i915#4171])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl1/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@input-checking:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][40] ([i915#4991])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb1/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][41] ([i915#4991])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-kbl6/igt@gem_userptr_blits@input-checking.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][42] ([i915#4991])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-snb6/igt@gem_userptr_blits@input-checking.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][43] ([i915#4991])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl7/igt@gem_userptr_blits@input-checking.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][44] ([i915#4991])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb6/igt@gem_userptr_blits@input-checking.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][45] ([i915#4991])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk6/igt@gem_userptr_blits@input-checking.html

  * igt@gem_wait@write-busy:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109315] / [i915#2575]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb3/igt@gem_wait@write-busy.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110892])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111644] / [i915#1397] / [i915#2411])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][49] -> [INCOMPLETE][50] ([i915#3921])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-snb5/igt@i915_selftest@live@hangcheck.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-snb6/igt@i915_selftest@live@hangcheck.html
    - shard-tglb:         [PASS][51] -> [DMESG-WARN][52] ([i915#5591])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb5/igt@i915_selftest@live@hangcheck.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb1/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#3743]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#6095]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb5/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3886]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3886]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [i915#3886]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-kbl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3689] / [i915#3886])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3689])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb6/igt@kms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/index.html

--===============6699461489618525041==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: IGT test cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104971/">https://patchwork.freedesktop.org/series/104971/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11752_full -&gt; IGTPW_7277_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/index.html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7277_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512.html">SKIP</a> +47 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x10} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x10.html">SKIP</a> +63 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb3/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32.html">SKIP</a> +59 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb5/igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10.html">SKIP</a> +79 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-dg1-19/igt@kms_3d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-dg1-13/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#3689]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-b-single-bo:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_cursor_legacy@pipe-b-single-bo.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-dg1-18/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11752_full and IGTPW_7277_full:</p>
<h3>New IGT tests (732)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.21, 0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.22, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.22, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.40, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.65, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.20, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.42, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.42, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.19, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.49, 1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.20, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.48, 2.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.24, 2.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.65, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.21, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.21, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.48, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.65, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.20, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.74, 2.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.84, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.13, 3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.79, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 3.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.05, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.70, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.80, 3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.80, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.80, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.77, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.77, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.76, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.79, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.77, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.75, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.74, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.73, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.84, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.78, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.79, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.85, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.84, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.58, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.54, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.54, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.48, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.27, 4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.27, 5.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.27, 5.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.27, 5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.58, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.01, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.25, 5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.27, 5.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.25, 5.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.01, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.01, 5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.25, 5.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.25, 5.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.25, 5.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.26, 5.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.25, 5.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 5.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 5.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 5.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 5.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 5.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 5.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.32, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.27, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.68, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.30, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.64, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.43, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.29, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.28, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.39, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.39, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.37, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.37, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.31, 4.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.90, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.92, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.96, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.94, 5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.16, 4.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.36, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.94, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.94, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.94, 5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.90, 5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-128x42:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-256x85:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-64x21:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.37, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.40, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.37, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.41, 4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.90, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.90, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.92, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.90, 5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.90, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.0, 3.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.92, 3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.37, 5.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.01, 3.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [5.67, 6.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.50] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7277_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-snb6/igt@gem_ctx_persistence@engines-hostile.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb5/igt@gem_eio@in-flight-contexts-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb6/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb8/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-kbl6/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-glk3/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb5/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb8/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([fdo#109271]) +92 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl1/igt@gem_softpin@evict-single-offset.html">FAIL</a> ([i915#4171])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-kbl6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-snb6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@write-busy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb3/igt@gem_wait@write-busy.html">SKIP</a> ([fdo#109315] / [i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#110892])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-snb5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb1/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> ([i915#5591])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11752/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb5/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-glk5/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-iclb2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-kbl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7277/shard-tglb6/igt@kms">SKIP</a> ([i915#3689])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6699461489618525041==--
