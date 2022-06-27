Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3833397455866444075=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Mon, 27 Jun 2022 15:49:17 -0000
Message-ID: <165634495773.11793.18285941442150984596@emeril.freedesktop.org>
References: <20220623160221.17205-1-jeevan.b@intel.com>
In-Reply-To: <20220623160221.17205-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_Create_dynamic_subtests?=
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

--===============3833397455866444075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: Create dynamic subtests
URL   : https://patchwork.freedesktop.org/series/105554/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11799_full -> IGTPW_7370_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7370_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7370_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7370_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32.html

  * {igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][2] +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * {igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-a} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5] +23 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-a.html

  * {igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-c} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][6] +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-c.html

  * {igt@kms_rotation_crc@rotation} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-1/igt@kms_rotation_crc@rotation.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_workarounds@suspend-resume:
    - {shard-tglu}:       [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglu-2/igt@gem_workarounds@suspend-resume.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglu-1/igt@gem_workarounds@suspend-resume.html

  * {igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x10}:
    - {shard-dg1}:        NOTRUN -> [SKIP][10] +27 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32:
    - {shard-rkl}:        NOTRUN -> [SKIP][11] +10 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32.html

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:
    - {shard-tglu}:       NOTRUN -> [SKIP][12] +13 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - {shard-rkl}:        [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - {shard-rkl}:        [SKIP][15] ([i915#1845] / [i915#4098]) -> [SKIP][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11799_full and IGTPW_7370_full:

### New IGT tests (410) ###

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.59] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.52] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 5.53] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_rotation_crc@bad-pixel-format@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.73] s

  * igt@kms_rotation_crc@bad-pixel-format@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 0.94] s

  * igt@kms_rotation_crc@bad-pixel-format@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.70, 0.91] s

  * igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.63] s

  * igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.65, 1.82] s

  * igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.61, 1.78] s

  * igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.40, 1.00] s

  * igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [0.41, 0.96] s

  * igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.46, 0.92] s

  * igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.87] s

  * igt@kms_rotation_crc@bad-pixel-format@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  * igt@kms_rotation_crc@bad-pixel-format@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.88] s

  * igt@kms_rotation_crc@bad-pixel-format@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.89] s

  * igt@kms_rotation_crc@bad-pixel-format@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@bad-pixel-format@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@bad-tiling@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.93] s

  * igt@kms_rotation_crc@bad-tiling@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 1.12] s

  * igt@kms_rotation_crc@bad-tiling@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 1.08] s

  * igt@kms_rotation_crc@bad-tiling@edp-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.64, 0.87] s

  * igt@kms_rotation_crc@bad-tiling@edp-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [1.81, 1.86] s

  * igt@kms_rotation_crc@bad-tiling@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.88, 1.89] s

  * igt@kms_rotation_crc@bad-tiling@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.91] s

  * igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [0.53, 1.60] s

  * igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [0.50, 1.30] s

  * igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.49, 1.33] s

  * igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 1.29] s

  * igt@kms_rotation_crc@bad-tiling@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_rotation_crc@bad-tiling@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_rotation_crc@bad-tiling@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_rotation_crc@bad-tiling@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@bad-tiling@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@exhaust-fences@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.14, 1.84] s

  * igt@kms_rotation_crc@exhaust-fences@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 2.00] s

  * igt@kms_rotation_crc@exhaust-fences@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.91] s

  * igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [1.49, 2.74] s

  * igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [1.90, 2.31] s

  * igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.92, 2.30] s

  * igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.92] s

  * igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.49] s

  * igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.44] s

  * igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@exhaust-fences@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.48] s

  * igt@kms_rotation_crc@exhaust-fences@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.38] s

  * igt@kms_rotation_crc@exhaust-fences@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_rotation_crc@exhaust-fences@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@exhaust-fences@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [14.13, 43.34] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [14.40, 43.47] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [13.87, 14.28] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [12.46, 40.59] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [13.56, 41.51] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [13.49, 41.57] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [13.51] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [9.38, 32.78] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [9.37, 32.48] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [9.37, 32.62] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [9.34, 18.59] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [32.64] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [32.46] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [32.58] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [14.12, 43.32] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [14.36, 43.49] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [13.86, 14.37] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [12.44, 40.71] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [13.56, 41.64] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [13.51, 41.66] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [13.49] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [32.53] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [32.51] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [32.59] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [32.59] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [32.43] s

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [32.44] s

  * igt@kms_rotation_crc@multiplane-rotation@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [14.11, 43.31] s

  * igt@kms_rotation_crc@multiplane-rotation@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [14.37, 43.48] s

  * igt@kms_rotation_crc@multiplane-rotation@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [13.87, 14.28] s

  * igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [12.50, 40.73] s

  * igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [13.59, 41.60] s

  * igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [13.55, 41.58] s

  * igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [13.58] s

  * igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [18.76, 32.67] s

  * igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [18.59, 32.55] s

  * igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [18.63, 32.61] s

  * igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [18.58, 21.12] s

  * igt@kms_rotation_crc@multiplane-rotation@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [32.69] s

  * igt@kms_rotation_crc@multiplane-rotation@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [32.51] s

  * igt@kms_rotation_crc@multiplane-rotation@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [32.46] s

  * igt@kms_rotation_crc@reflect:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [1.22, 1.24] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [1.22, 1.23] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [1.22, 1.27] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.34, 3.50] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.43, 4.55] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.39, 4.48] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.40] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.47, 4.60] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.43, 4.55] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.39, 4.48] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [4.18, 5.27] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.20] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.19] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [4.08] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [4.12, 5.30] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.20] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 5.18] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [4.10] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [4.16, 5.30] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [4.09, 5.20] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.20] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [4.12, 5.28] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.21] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.99, 5.17] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [4.09] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-a:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.20, 5.30] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-b:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.19] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-c:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.20] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-a:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.32] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-b:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.21, 5.19] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-c:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.18] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-a:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.27] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-b:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.23] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-c:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.17] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-a:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.27] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-b:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.21] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-c:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [1.22, 5.17] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [1.22] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.43] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.43] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.44] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.37] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.42] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.39] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.42] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.46] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.43] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_rotation_crc@rotation@cursor-rotation-180-vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.19, 2.49] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.53] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.21, 2.26] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.45, 4.63] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.43, 4.55] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.39, 4.54] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.78, 2.84] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.76, 2.75] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.74, 2.73] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.76] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_rotation_crc@rotation@primary-rotation-180-vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.27, 3.31] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 3.29] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.83, 3.25] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [4.22, 5.51] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [4.08, 5.27] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.97, 5.23] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.53, 4.16] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 3.98] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.39, 3.96] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [4.07] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.86] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [3.86] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@primary-rotation-270-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.06, 3.16] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.26, 3.28] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.88, 3.29] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.99, 4.33] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.94, 5.22] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [4.12, 5.27] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 4.08] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.46, 3.93] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 3.96] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.85] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [3.89] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@primary-rotation-90-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.50] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.22, 2.56] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.23, 2.29] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.90, 3.74] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [2.90, 3.71] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.87, 3.71] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.32, 2.21] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 2.21] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 2.21] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.18] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-180-vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.31, 3.40] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.25, 3.27] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.87, 3.30] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.32, 4.22] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.27, 4.24] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.33, 4.22] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.34] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.83, 3.13] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.89, 3.13] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.81, 3.13] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.06] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.09] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [3.06] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-270-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.25, 3.28] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.27, 3.31] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [2.86, 3.28] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 4.24] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.31, 4.28] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.30, 4.27] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [1.84, 3.16] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [1.80, 3.17] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [1.81, 3.02] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.11] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.07] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [3.07] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@rotation@sprite-rotation-90-vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@dp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.13] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@dp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@dp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.09] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 4.25] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [3.37, 4.21] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.31] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-a:
    - Statuses : 3 pass(s)
    - Exec time: [1.55, 3.77] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-b:
    - Statuses : 3 pass(s)
    - Exec time: [1.60, 3.65] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [1.81, 3.50] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [1.80, 3.67] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [3.04] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [3.08] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7370_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#6268])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#1099]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][26] -> [FAIL][27] ([i915#2842]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-snb:          NOTRUN -> [INCOMPLETE][32] ([i915#4972])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-snb5/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#118])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-glk7/igt@gem_exec_whisper@basic-queues-priority.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk5/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglb5/igt@gem_huc_copy@huc-copy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#4613]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl7/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][39] ([i915#2658])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl3/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#4270]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb2/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#4270])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb8/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271]) +120 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#768])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3297])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@gem_userptr_blits@access-control.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#3297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@gem_userptr_blits@access-control.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#5566] / [i915#716])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl4/igt@gen9_exec_parse@allowed-single.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#2527] / [i915#2856]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb2/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2856])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb5/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl8/igt@i915_pm_dc@dc9-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl8/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109289])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109506] / [i915#2411])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][55] -> [DMESG-WARN][56] ([i915#5591])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglb6/igt@i915_selftest@live@hangcheck.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3826])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#3826])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111615]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3689] / [i915#6095]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#6095])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3886]) +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3886])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3689] / [i915#3886]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#3886])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615] / [i915#3689]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3689]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk7/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_color@pipe-a-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / [i915#3555])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb7/igt@kms_color@pipe-a-deep-color.html

  * igt@kms_color@pipe-b-deep-color:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +205 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl7/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#1149])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-snb:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-snb7/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl4/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb3/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3359]) +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170.html

  * {igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][80] ([i915#3359]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109274]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][83] ([i915#180]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2587])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +7 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109280] / [fdo#111825]) +10 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          NOTRUN -> [SKIP][87] ([fdo#109271]) +113 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#3555]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_hdr@bpc-switch-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#3555])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][90] ([i915#180])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][91] ([i915#265])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-glk:          NOTRUN -> [FAIL][92] ([i915#265])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][93] ([i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#5176]) +7 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb2/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#5176]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271]) +103 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#5235]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#5235]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#658]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2920])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb6/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-glk:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#658])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl1/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [PASS][104] -> [SKIP][105] ([fdo#109642] / [fdo#111068] / [i915#658])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][106] -> [SKIP][107] ([fdo#109441])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][108] ([i915#132] / [i915#3467])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@kms_psr@psr2_sprite_plane_onoff.html
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109441])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][110] -> [SKIP][111] ([i915#5519])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109278]) +13 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb3/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#2437])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl1/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2437]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl7/igt@kms_writeback@writeback-check-output.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109289])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@perf@mi-rpc.html

  * igt@prime_nv_pcopy@test1_micro:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#109291]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@prime_nv_pcopy@test1_micro.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109291]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2994])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@split-25:
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2994]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - {shard-rkl}:        [SKIP][120] ([i915#2582]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@fbdev@info.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@fbdev@info.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][122] ([i915#180]) -> [PASS][123] +4 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_balancer@fairslice:
    - {shard-rkl}:        [SKIP][124] ([i915#6259]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@gem_exec_balancer@fairslice.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-2/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][126] ([i915#4525]) -> [PASS][127] +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - {shard-tglu}:       [FAIL][128] ([i915#2842]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglu-1/igt@gem_exec_fair@basic-flow@rcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglu-8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][130] ([i915#2842]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][132] ([i915#2849]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - {shard-rkl}:        [SKIP][134] ([i915#6251]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@gem_exec_fence@basic-wait@bcs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-1/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - {shard-rkl}:        [SKIP][136] ([i915#3281]) -> [PASS][137] +5 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][138] ([i915#4936]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_readwrite@beyond-eob:
    - {shard-rkl}:        [SKIP][140] ([i915#3282]) -> [PASS][141] +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@gem_readwrite@beyond-eob.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@gem_readwrite@beyond-eob.html

  * igt@gen9_exec_parse@bb-large:
    - {shard-rkl}:        [SKIP][142] ([i915#2527]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-2/igt@gen9_exec_parse@bb-large.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@gen9_exec_parse@bb-large.html

  * igt@i915_hangman@gt-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][144] ([i915#6258]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][146] ([i915#454]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - {shard-dg1}:        [SKIP][148] ([i915#1937]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@i2c:
    - {shard-rkl}:        [SKIP][150] ([fdo#109308]) -> [PASS][151] +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@i915_pm_rpm@i2c.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@i915_pm_rpm@i2c.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - {shard-rkl}:        [SKIP][152] ([i915#1845] / [i915#4098]) -> [PASS][153] +21 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_color@pipe-a-ctm-red-to-blue:
    - {shard-rkl}:        [SKIP][154] ([i915#1149] / [i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][155] +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-2/igt@kms_color@pipe-a-ctm-red-to-blue.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_color@pipe-a-ctm-red-to-blue.html

  * igt@kms_color@pipe-b-degamma:
    - {shard-rkl}:        [SKIP][156] ([i915#1149] / [i915#1849] / [i915#4098]) -> [PASS][157] +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@kms_color@pipe-b-degamma.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x21:
    - shard-tglb:         [INCOMPLETE][158] -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-tglb6/igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x21.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x21.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][160] ([i915#2346]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:
    - shard-glk:          [SKIP][162] ([fdo#109271]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk6/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - {shard-rkl}:        [SKIP][164] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][165] +6 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_fbcon_fbt@psr:
    - {shard-rkl}:        [SKIP][166] ([fdo#110189] / [i915#3955]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@kms_fbcon_fbt@psr.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [SKIP][168] ([i915#3701]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - {shard-rkl}:        [SKIP][170] ([i915#1849] / [i915#4098]) -> [PASS][171] +23 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [FAIL][172] ([i915#1188]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_invalid_mode@bad-hsync-start:
    - {shard-rkl}:        [SKIP][174] ([i915#4278]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@kms_invalid_mode@bad-hsync-start.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html

  * igt@kms_plane@plane-position-hole@pipe-b-planes:
    - {shard-rkl}:        [SKIP][176] ([i915#3558]) -> [PASS][177] +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - {shard-rkl}:        [SKIP][178] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [SKIP][180] ([i915#5176]) -> [PASS][181] +1 similar issue
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_psr@primary_render:
    - {shard-rkl}:        [SKIP][182] ([i915#1072]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@kms_psr@primary_render.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][184] ([fdo#109441]) -> [PASS][185] +1 similar issue
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - {shard-rkl}:        [SKIP][186] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][187] +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@gen12-mi-rpc:
    - {shard-rkl}:        [SKIP][188] ([fdo#109289]) -> [PASS][189] +1 similar issue
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-5/igt@perf@gen12-mi-rpc.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-2/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - {shard-dg1}:        [FAIL][190] ([i915#5234]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-dg1-19/igt@perf_pmu@all-busy-idle-check-all.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-dg1-19/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@prime_vgem@basic-fence-read:
    - {shard-rkl}:        [SKIP][192] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@prime_vgem@basic-fence-read.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - {shard-rkl}:        [SKIP][194] ([fdo#109295] / [fdo#111656] / [i915#3708]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-rkl-1/igt@prime_vgem@coherency-gtt.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_heartbeat_interval@precise@rcs0:
    - {shard-dg1}:        [FAIL][196] ([i915#1755]) -> [PASS][197] +6 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-dg1-17/igt@sysfs_heartbeat_interval@precise@rcs0.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-dg1-18/igt@sysfs_heartbeat_interval@precise@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][198] ([i915#6117]) -> [SKIP][199] ([i915#4525])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][200] ([fdo#111068] / [i915#658]) -> [SKIP][201] ([i915#2920])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][206], [FAIL][207], [FAIL][208], [FAIL][209]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl8/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl7/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl1/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl1/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl8/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl7/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
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
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issu

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/index.html

--===============3833397455866444075==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: Create dynamic subte=
sts</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105554/">https://patchwork.freedesktop.org/series/105554/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7370/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11799_full -&gt; IGTPW_7370_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7370_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7370_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7370=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pip=
e-d-hdmi-a-1-32x32.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-dg1-12/igt@kms_cursor_crc@cursor-sliding@pip=
e-d-hdmi-a-1-512x512.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-tglb7/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7370/shard-tglb7/igt@kms_plane@plane-panning-bottom-right=
-suspend@pipe-b-planes.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-a} =
(NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_rotation_crc@reflect@primary-4=
-tiled-reflect-x-0-edp-1-pipe-a.html">SKIP</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-c=
} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_rotation_crc@reflect@primary-4=
-tiled-reflect-x-180-edp-1-pipe-c.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_rotation_crc@rotation} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-rkl-1/igt@kms_rotation_crc@rotation.html">SK=
IP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-tglu-2/igt@gem_workarounds@suspend-resume.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shar=
d-tglu-1/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x10}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-dg1-17/igt@kms_cursor_crc@cursor-offscreen@p=
ipe-d-hdmi-a-1-32x10.html">SKIP</a> +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-moveme=
nt@pipe-b-edp-1-32x32.html">SKIP</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pip=
e-b-hdmi-a-1-32x32.html">SKIP</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@kms_rotation_crc@multiplane-rotation-cropping=
-top.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7370/shard-rkl-2/igt@kms_rotation_crc@multiplane-rotation-cropping=
-top.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1845">i915#1845</a> / [i915#4098]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11799_full and IGTPW_7370_=
full:</p>
<h3>New IGT tests (410)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.70, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.65, 1.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.61, 1.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.40, 1.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.41, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.46, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.64, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.81, 1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.88, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.53, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.50, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.49, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.14, 1.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.49, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.90, 2.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.92, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.13, 43.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.40, 43.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.87, 14.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-a:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.46, 40.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-b:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.56, 41.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-c:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.49, 41.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@edp-1-pipe-d:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-a=
:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [9.38, 32.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-b=
:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [9.37, 32.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-c=
:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [9.37, 32.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-1-pipe-d=
:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [9.34, 18.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-2-pipe-a=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-2-pipe-b=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom@hdmi-a-2-pipe-c=
:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.12, 43.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.36, 43.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.86, 14.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.44, 40.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.56, 41.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.51, 41.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-1-pipe-a:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-1-pipe-b:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-1-pipe-c:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-2-pipe-a:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-2-pipe-b:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top@hdmi-a-2-pipe-c:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.11, 43.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [14.37, 43.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.87, 14.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [12.50, 40.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.59, 41.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [13.55, 41.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [13.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [18.76, 32.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [18.59, 32.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [18.63, 32.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [18.58, 21.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [32.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-a:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.22, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-b:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-c:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-edp-1-pipe-d:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-1-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-1-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-1-pipe-c=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-2-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-2-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-hdmi-a-2-pipe-c=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-vga-1-pipe-a:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-0-vga-1-pipe-b:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-dp-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-dp-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-dp-1-pipe-c:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-a:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.22, 1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-b:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.22, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-c:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-edp-1-pipe-d:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-1-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-1-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-1-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-2-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-2-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-hdmi-a-2-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-vga-1-pipe-a:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-4-tiled-reflect-x-180-vga-1-pipe-b:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-a:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.34, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-b:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.43, 4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-c:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.39, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-edp-1-pipe-d:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-1-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-1-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-1-pipe-c=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-2-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-2-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-hdmi-a-2-pipe-c=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-vga-1-pipe-a:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-0-vga-1-pipe-b:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-dp-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-dp-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-dp-1-pipe-c:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-a:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.47, 4.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-b:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.43, 4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-c:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.39, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-edp-1-pipe-d:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-1-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-1-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-1-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-2-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-2-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-hdmi-a-2-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-vga-1-pipe-a:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-x-tiled-reflect-x-180-vga-1-pipe-b:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-a:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.18, 5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-b:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-c:</=
p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-edp-1-pipe-d:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-1-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-1-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-1-pipe-c=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-2-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-2-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-hdmi-a-2-pipe-c=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-vga-1-pipe-a:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-0-vga-1-pipe-b:</=
p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-dp-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-dp-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-dp-1-pipe-c:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-a:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.12, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-b:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-c:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-edp-1-pipe-d:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-1-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-1-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-1-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-2-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-2-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-hdmi-a-2-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-vga-1-pipe-a:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-180-vga-1-pipe-b:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-dp-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-dp-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-dp-1-pipe-c:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-a:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.16, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-b:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.09, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-c:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-edp-1-pipe-d:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-1-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-1-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-1-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-2-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-2-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-hdmi-a-2-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-vga-1-pipe-a:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-270-vga-1-pipe-b:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-dp-1-pipe-a:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-dp-1-pipe-b:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-dp-1-pipe-c:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.12, 5.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.01, 5.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-c:<=
/p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.99, 5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-edp-1-pipe-d:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-1-pipe-=
a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-1-pipe-=
b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-1-pipe-=
c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-2-pipe-=
a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-2-pipe-=
b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-hdmi-a-2-pipe-=
c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-vga-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-y-tiled-reflect-x-90-vga-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-dp-1-pipe-a:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-dp-1-pipe-b:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-dp-1-pipe-c:</=
p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.20, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-c:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-edp-1-pipe-d:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-1-pipe-=
a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-1-pipe-=
b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-1-pipe-=
c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-2-pipe-=
a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-2-pipe-=
b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-hdmi-a-2-pipe-=
c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-vga-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-0-vga-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-dp-1-pipe-a:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-dp-1-pipe-b:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-dp-1-pipe-c:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-a=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-b=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.21, 5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-c=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-edp-1-pipe-d=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-1-pip=
e-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-1-pip=
e-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-1-pip=
e-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-2-pip=
e-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-2-pip=
e-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-hdmi-a-2-pip=
e-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-vga-1-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-180-vga-1-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-dp-1-pipe-a:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-dp-1-pipe-b:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-dp-1-pipe-c:=
</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-a=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-b=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-c=
:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-edp-1-pipe-d=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-1-pip=
e-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-1-pip=
e-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-1-pip=
e-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-2-pip=
e-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-2-pip=
e-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-hdmi-a-2-pip=
e-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-vga-1-pipe-a=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-270-vga-1-pipe-b=
:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-dp-1-pipe-a:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-dp-1-pipe-b:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-dp-1-pipe-c:<=
/p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-a:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-b:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-c:=
</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [1.22, 5.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-edp-1-pipe-d:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [1.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-1-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-1-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-1-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-2-pipe=
-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-2-pipe=
-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-hdmi-a-2-pipe=
-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-vga-1-pipe-a:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@reflect@primary-yf-tiled-reflect-x-90-vga-1-pipe-b:=
</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@cursor-rotation-180-vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.19, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.21, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.45, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.43, 4.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.39, 4.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.78, 2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.76, 2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.74, 2.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-180-vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.27, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.83, 3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.22, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.08, 5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.97, 5.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.53, 4.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 3.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.39, 3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-270-vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.06, 3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.26, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.88, 3.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.99, 4.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.94, 5.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.12, 5.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 4.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 3.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@primary-rotation-90-vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.23, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.22, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.23, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.90, 3.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.90, 3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.87, 3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.32, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 2.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-180-vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.31, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.25, 3.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.87, 3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.32, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.27, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.33, 4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.83, 3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.89, 3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.81, 3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-270-vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.25, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.27, 3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.86, 3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.31, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.30, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.84, 3.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.80, 3.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.81, 3.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@rotation@sprite-rotation-90-vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 4.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.37, 4.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.55, 3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.60, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.81, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.80, 3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7370_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-tglb5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard=
-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-apl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
70/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb2/igt@gem_exec_balancer@parallel-contexts.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/=
shard-iclb7/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4=
525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-k=
bl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11799/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/sh=
ard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842=
]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11799/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/s=
hard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#28=
42])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/sh=
ard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-snb5/igt@gem_exec_suspend@basic-s4-devices@s=
mem.html">INCOMPLETE</a> ([i915#4972])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-glk7/igt@gem_exec_whisper@basic-queues-priority.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_737=
0/shard-glk5/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-tglb7/ig=
t@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issu">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@gem_lmem_swapping@parallel-multi.h=
tml">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-kbl7/igt@gem_lmem_swapping@verify-ccs.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> =
([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> =
([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb2/igt@gem_pxp@create-regular-context-2.h=
tml">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb8/igt@gem_pxp@verify-pxp-stale-ctx-execu=
tion.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-glk3/igt@gem_render_copy@y-tiled-ccs-to-y-til=
ed-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +120 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb2/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-tglb7/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb2/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-apl4/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-=
apl2/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> ([i915#5566] /=
 [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb2/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb5/igt@gen9_exec_parse@unaligned-jump.htm=
l">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-apl8/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl8/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb5/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@i915_pm_rpm@pc8-residency.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506">f=
do#109506</a> / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-tglb6/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-t=
glb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> ([i915#5591])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> ([i915#3826])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb7/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_ccs@pipe-a-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#6095]) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#3886]) +6 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / [i915#3886])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-tglb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar is=
sues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-glk8/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / [i915#3886])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109278">fdo#109278</a> / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / [i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-glk7/igt@kms_chamelium@dp-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_chamelium@hdmi-crc-nonplanar-fo=
rmats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb7/igt@kms_color@pipe-a-deep-color.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-kbl7/igt@kms_color@pipe-b-deep-color.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +205 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb8/igt@kms_color@pipe-d-ctm-0-5.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-snb7/igt@kms_color_chamelium@pipe-a-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-kbl4/igt@kms_color_chamelium@pipe-a-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb3/igt@kms_color_chamelium@pipe-b-ctm-0-5=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-max=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@kms_color_chamelium@pipe-d-degamma=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@kms_cursor_crc@cursor-random@pipe-=
c-edp-1-512x170.html">SKIP</a> ([i915#3359]) +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pip=
e-d-hdmi-a-1-512x512.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb6/igt@kms_flip@2x-dpms-vs-vblank-race.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb7/igt@kms_flip@2x-flip-vs-dpms-off-vs-mo=
deset-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-rte.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +10 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +113 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_hdr@bpc-switch-dpms.html">SKIP<=
/a> ([i915#3555]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb3/igt@kms_hdr@bpc-switch-dpms.html">SKIP<=
/a> ([i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@kms_hdr@bpc-switch-suspend@pipe-a-d=
p-1.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-c-edp=
-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-tglb2/igt@kms_plane_scaling@plane-upscale-wit=
h-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> ([i915#5176]) +7 similar=
 issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_plane_scaling@plane-upscale-wit=
h-rotation-factor-0-25@pipe-c-edp-1.html">SKIP</a> ([i915#5176]) +2 similar=
 issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_plane_scaling@planes-upscale-fa=
ctor-0-25-downscale-factor-0-25@pipe-b-dp-1.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +103 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> ([i915#5235]) =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-25@pipe-c-edp-1.html">SKIP</a> ([i915#5235]) =
+3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-tglb6/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-glk1/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-kbl1/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/sha=
rd-iclb6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>=
 / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shar=
d-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-tglb3/igt@kms_psr@psr2_sprite_plane_onoff.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132=
">i915#132</a> / [i915#3467])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-iclb5/igt@kms_psr@psr2_sprite_plane_onoff.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1094=
41">fdo#109441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb7/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7370/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate=
-overlay.html">SKIP</a> ([i915#5519])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb3/igt@kms_vblank@pipe-d-wait-forked.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
8">fdo#109278</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-apl1/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / [i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7370/shard-kbl7/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / [i915#2437]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb5/igt@perf@mi-rpc.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>)=
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_micro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-tglb3/igt@prime_nv_pcopy@test1_micro.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">=
fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-iclb2/igt@prime_nv_test@nv_write_i915_gtt_mm=
ap_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-apl2/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7370/shard-kbl6/igt@sysfs_clients@split-25.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / [i915#2994]) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@fbdev@info.html">SKIP</a> ([i915#2582]) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6=
/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7370/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PAS=
S</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@gem_exec_balancer@fairslice.html">SKIP</a> ([=
i915#6259]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7370/shard-rkl-2/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> ([i915#4525]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7370/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html">P=
ASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-tglu-1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a>=
 ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7370/shard-tglu-8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7370/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7370/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a>=
 ([i915#6251]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7370/shard-rkl-1/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-active.html">=
SKIP</a> ([i915#3281]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7370/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-active.htm=
l">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-dg1-16/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG=
-WARN</a> ([i915#4936]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7370/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i91=
5#3282]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
70/shard-rkl-5/igt@gem_readwrite@beyond-eob.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-2/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i91=
5#2527]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_73=
70/shard-rkl-5/igt@gen9_exec_parse@bb-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@i915_hangman@gt-engine-error@bcs0.html">SKIP<=
/a> ([i915#6258]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7370/shard-rkl-2/igt@i915_hangman@gt-engine-error@bcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shar=
d-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-dg1-18/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1937">=
i915#1937</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7370/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@i915_pm_rpm@i2c.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#109308</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/=
igt@i915_pm_rpm@i2c.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-2/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen1=
2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1845">i915#1845</a> / [i915#4098]) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_ccs@pipe-b-crc=
-primary-basic-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +21 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-2/igt@kms_color@pipe-a-ctm-red-to-blue.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1=
149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">=
i915#1849</a> / [i915#4070] / [i915#4098]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_color@pipe-a-ctm-r=
ed-to-blue.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@kms_color@pipe-b-degamma.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#184=
9</a> / [i915#4098]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7370/shard-rkl-6/igt@kms_color@pipe-b-degamma.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x21:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-tglb6/igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x=
21.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7370/shard-tglb3/igt@kms_cursor_crc@cursor-random@pipe-a-edp-1=
-64x21.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-glk9/igt@kms_cursor_legacy@=
flip-vs-cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-glk8/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a=
-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7370/shard-glk6/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a=
-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-render-y=
tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111314">fdo#111314</a> / [i915#4098] / [i915#4369]) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_draw=
_crc@draw-method-xrgb2101010-render-ytiled.html">PASS</a> +6 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D110189">fdo#110189</a> / [i9=
15#3955]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
370/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> ([i915#3701]) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@kms_flip_scale=
d_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-p=
write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1849">i915#1849</a> / [i915#4098]) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_frontbuffer_tracking=
@fbc-rgb101010-draw-pwrite.html">PASS</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-kbl7/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/=
shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-start:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@kms_invalid_mode@bad-hsync-start.html">SKIP</=
a> ([i915#4278]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7370/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-start.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@kms_plane@plane-position-hole@pipe-b-planes.h=
tml">SKIP</a> ([i915#3558]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-=
planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849=
">i915#1849</a> / [i915#4070] / [i915#4098]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms_plane_alpha_blen=
d@pipe-b-alpha-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> ([i915#5176]) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-iclb4/igt@=
kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-=
edp-1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@kms_psr@primary_render.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-r=
kl-6/igt@kms_psr@primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shar=
d-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@kms_universal_plane@universal-plane-gen9-feat=
ures-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1845">i915#1845</a> / [i915#4070] / [i915#4098]) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-6/igt@kms=
_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-5/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-rkl-=
2/igt@perf@gen12-mi-rpc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-dg1-19/igt@perf_pmu@all-busy-idle-check-all.html">FAIL<=
/a> ([i915#5234]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7370/shard-dg1-19/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295=
</a> / [i915#3291] / [i915#3708]) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7370/shard-rkl-5/igt@prime_vgem@basic-fence-read.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-rkl-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">fdo#109295</a=
> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111656">fdo#1=
11656</a> / [i915#3708]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7370/shard-rkl-5/igt@prime_vgem@coherency-gtt.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-dg1-17/igt@sysfs_heartbeat_interval@precise@rcs0.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">=
i915#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7370/shard-dg1-18/igt@sysfs_heartbeat_interval@precise@rcs0.html">PASS<=
/a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> ([i915#6117]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7370/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11799/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / [i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7370/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html=
">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11799/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl7/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11799/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11799/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/180">i915#180</a> / [i915#3002] / [i915#4312] / [i915#5257]) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl8/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7370/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7370/shard-apl2/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7370/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / [i9=
15#3002] / [i915#4312] / [i915#5257])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3833397455866444075==--
