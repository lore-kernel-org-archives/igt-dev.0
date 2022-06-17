Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1600299402345709118=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 17 Jun 2022 08:20:00 -0000
Message-ID: <165545400045.20133.18307574527658458998@emeril.freedesktop.org>
References: <20220616215654.5522-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220616215654.5522-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=2Ec=3A_Test_Cleanup?=
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

--===============1600299402345709118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc.c: Test Cleanup
URL   : https://patchwork.freedesktop.org/series/105256/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11771_full -> IGTPW_7329_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/index.html

Participating hosts (10 -> 7)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7329_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-d} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +67 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-d.html

  * {igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-a} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +50 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-a.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11771_full and IGTPW_7329_full:

### New IGT tests (993) ###

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.29] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.27] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.35] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.26] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.29] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.26] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.29] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.27] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.29] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.29] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.29] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.45] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.33] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.33] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.41] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.33] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.34] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.21] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.39] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.34] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.22] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.22] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.15] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.37] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.29] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.26] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.32] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.35] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.35] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.25] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.26] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.24] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.34] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.34] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.22] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@dp-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@dp-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@dp-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.26] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.48] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.46] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.32] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.17] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.40] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.25] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.25] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.28] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.39] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.23] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.28, 0.29] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.14, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.34] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.29] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.36] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.21] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.29] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.11, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.29] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.09, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.09] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.32] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.29] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.34] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.28] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@dp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@dp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@dp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-a:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-b:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-c:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-d:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-1-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-2-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-2-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-2-pipe-c:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@vga-1-pipe-a:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@vga-1-pipe-b:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.28] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@dp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@dp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.12, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.27] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-b:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-c:
    - Statuses : 2 pass(s)
    - Exec time: [0.10, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.10] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-1-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-2-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-2-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-2-pipe-c:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled@dp-1-pipe-a:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.27] s

  * igt@kms_draw_crc@draw-me

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/index.html

--===============1600299402345709118==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc.c: Test Cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105256/">https://patchwork.freedesktop.org/series/105256/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11771_full -&gt; IGTPW_7329_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/index.html</p>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7329_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-d} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-d.html">SKIP</a> +67 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-a} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7329/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-a.html">SKIP</a> +50 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11771_full and IGTPW_7329_full:</p>
<h3>New IGT tests (993)</h3>
<ul>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.28, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.14, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.11, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.09, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@dp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@dp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.12, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-b:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-c:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.10, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@edp-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-1-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-2-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-2-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@hdmi-a-2-pipe-c:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@vga-1-pipe-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled@vga-1-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled@dp-1-pipe-a:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-me</p>
</li>
</ul>

</body>
</html>

--===============1600299402345709118==--
