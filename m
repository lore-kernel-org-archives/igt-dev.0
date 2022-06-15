Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0499429971117592355=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 15 Jun 2022 01:47:18 -0000
Message-ID: <165525763893.14601.15825233936162926697@emeril.freedesktop.org>
References: <20220610085711.4087880-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220610085711.4087880-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_IGT_test_cleanup_=28rev2=29?=
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

--===============0499429971117592355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: IGT test cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/104971/
State : success

== Summary ==

CI Bug Log - changes from IGT_6523_full -> IGTPW_7300_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/index.html

Participating hosts (9 -> 9)
------------------------------

  Additional (1): shard-rkl 
  Missing    (1): shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7300_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +59 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb3/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +79 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb3/igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10.html

  * {igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][4] +63 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@api_intel_bb@crc32}:
    - shard-tglb:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb8/igt@api_intel_bb@crc32.html

  * {igt@kms_plane_lowres@tiling-y@pipe-a-edp-1}:
    - {shard-rkl}:        NOTRUN -> [SKIP][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-rkl-6/igt@kms_plane_lowres@tiling-y@pipe-a-edp-1.html

  
New tests
---------

  New tests have been introduced between IGT_6523_full and IGTPW_7300_full:

### New IGT tests (707) ###

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.39, 0.49] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [0.55, 0.66] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.82] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.53] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-edp-1:
    - Statuses : 3 pass(s)
    - Exec time: [1.29, 1.44] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.50] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.33] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.55] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.42] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.53] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.41, 0.49] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.67] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.78] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.53] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.41] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.47] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.55] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.49] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.51] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.02, 1.18] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.99, 3.23] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.89, 1.58] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.25] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.77, 3.97] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.78, 1.20] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.04, 1.29] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.78, 3.97] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.79, 1.24] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.77] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.54] s

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
    - Exec time: [2.42, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.39, 2.48] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [2.63, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [2.63, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [2.62, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [2.62, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [2.63, 3.43] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [1.86, 2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 2.58] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.77] s

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
    - Exec time: [2.35] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.46, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.46, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [2.62, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [2.61, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [2.63, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [2.62, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [2.63, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [2.63, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.57] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.51] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.49] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
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
    - Exec time: [2.33] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.55] s

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
    - Exec time: [2.42, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.58] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.59, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.51] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.08] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 2.50] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.64] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

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
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.82] s

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
    - Exec time: [2.72, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.67, 2.76] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.67] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.84, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.84, 3.66] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.64] s

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
    - Exec time: [2.83, 3.66] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.06, 2.90] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 2.77] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 2.80] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.07] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.84] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 3.12] s

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
    - Exec time: [2.58] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.74, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.73, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.79, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.80, 3.66] s

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
    - Exec time: [2.81, 3.63] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.78, 3.62] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 2.77] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 2.79] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 2.74] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.84] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.81] s

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
    - Exec time: [2.72, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.73, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.75, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.71, 2.83] s

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
    - Exec time: [2.81, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.81, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.80, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.82, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.78] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.79] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.79] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 2.78] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.07] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.07] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.32, 2.86] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.80] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

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
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.54, 4.66] s

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
    - Exec time: [4.56, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.82] s

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
    - Exec time: [4.05, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.36, 4.85] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.63] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.73] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.69] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [5.12] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-128x42:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

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
    - Exec time: [4.57] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.66] s

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
    - Exec time: [4.54, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.02, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.02, 5.52] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.06, 5.48] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.71] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.61] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.70] s

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
    - Exec time: [0.01] s

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
    - Exec time: [4.57, 4.68] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

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
    - Exec time: [4.57, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.69] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.00, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 5.46] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

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
    - Exec time: [4.01, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.61] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.70] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.69] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.11] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

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

  * igt@kms_cursor_crc@cursor-rapid-movement:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.33, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.33, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.51] s

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
    - Exec time: [0.33, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.44] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.33] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.32] s

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
    - Exec time: [1.28, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.54] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.63] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.60] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.06] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.07] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.60] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.87] s

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
    - Exec time: [0.22] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.49] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

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
    - Exec time: [0.35, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.26, 1.31] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.25, 1.35] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.27, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.25, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.35] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.22, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.62] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.59] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.62] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.58] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 0.54] s

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
    - Exec time: [0.37, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.35, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.51] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.37, 0.50] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

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
    - Exec time: [0.35, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.53] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.36] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.34] s

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
    - Exec time: [1.27, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.37] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.57] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.58] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.60] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.55] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.10] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.10] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.17, 0.52] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 0.62] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [1.27] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.30] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

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
    - Exec time: [1.30] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [0.18] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.69] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.68, 0.82] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 1.01] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.62, 0.74] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.46, 1.63] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.71] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.74] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.60] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.72] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.46] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.39, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.39, 4.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.39, 4.49] s

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
    - Exec time: [4.39, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.32, 4.41] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.93, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.92, 5.30] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [3.90, 5.31] s

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
    - Statuses : 2 pass(s)
    - Exec time: [2.20, 4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 4.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.16, 4.74] s

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
    - Exec time: [4.24] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.40, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.42, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.39, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.40, 4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.89, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.92, 5.30] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

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
    - Exec time: [3.95, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.93, 5.36] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 4.49] s

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
    - Exec time: [4.41, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.40, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.41, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.38, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.40, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [3.94, 5.33] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.92, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [3.95, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

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
    - Exec time: [3.91, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.91, 5.33] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.16, 4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.46] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.07] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.94] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.91] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.17] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.91, 3.70] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.63, 5.41] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.26, 4.27] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.90] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.03, 3.69] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.34, 6.06] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.07] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.94] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.13, 3.69] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.35, 6.14] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 5.30] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [6.15] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.28] s

  * igt@kms_plane_lowres@tiling-y@pipe-d-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7300_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb2/igt@feature_discovery@psr2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#5325])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-snb6/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-glk:          [PASS][11] -> [TIMEOUT][12] ([i915#3063])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk2/igt@gem_eio@in-flight-contexts-10ms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#4525]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][15] ([i915#6141])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#2849])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@secure-non-master:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#112283])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb8/igt@gem_exec_params@secure-non-master.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#112283])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb6/igt@gem_exec_params@secure-non-master.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#4613]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#111656])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb7/igt@gem_mmap_gtt@coherency.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109292])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb4/igt@gem_mmap_gtt@coherency.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3297])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#3297])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-apl8/igt@gem_workarounds@suspend-resume-context.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl8/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][34] -> [DMESG-WARN][35] ([i915#5566] / [i915#716])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][36] ([fdo#109271]) +154 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#2527] / [i915#2856]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#2856]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb7/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111644] / [i915#1397] / [i915#2411])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110892])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#5903])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          NOTRUN -> [DMESG-WARN][42] ([i915#180])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl4/igt@i915_suspend@debugfs-reader.html
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-kbl3/igt@i915_suspend@debugfs-reader.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#5286]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110723])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
    - shard-glk:          [PASS][47] -> [FAIL][48] ([i915#1888] / [i915#5046])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk9/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#3886]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3689] / [i915#3886]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3886]) +7 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3886]) +9 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +11 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb3/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111615] / [i915#3689])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#6095]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3742])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb8/igt@kms_chamelium@vga-frame-dump.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk9/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb6/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html
    - shard-snb:          NOTRUN -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-snb2/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][65] ([i915#1319]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl4/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][66] ([i915#1319])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl3/igt@kms_content_protection@srm.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#1063])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109300] / [fdo#111066])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb5/igt@kms_content_protection@srm.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271]) +149 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl8/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10.html

  * {igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][70] ([fdo#109271]) +95 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk1/igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-iclb:         [PASS][71] -> [FAIL][72] ([i915#5072])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109274] / [fdo#109278]) +1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/index.html

--===============0499429971117592355==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: IGT test cleanup (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104971/">https://patchwork.freedesktop.org/series/104971/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6523_full -&gt; IGTPW_7300_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>Additional (1): shard-rkl <br />
  Missing    (1): shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7300_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb3/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32.html">SKIP</a> +59 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb3/igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-32x10.html">SKIP</a> +79 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32.html">SKIP</a> +63 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@api_intel_bb@crc32}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb8/igt@api_intel_bb@crc32.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane_lowres@tiling-y@pipe-a-edp-1}:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-rkl-6/igt@kms_plane_lowres@tiling-y@pipe-a-edp-1.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6523_full and IGTPW_7300_full:</p>
<h3>New IGT tests (707)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.39, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.55, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.29, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.33] s</li>
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
<li>Exec time: [1.28, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.41, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.78] s</li>
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
<li>Exec time: [0.44, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.47] s</li>
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
<li>Exec time: [1.29, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.02, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.99, 3.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.89, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.77, 3.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.78, 1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.04, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.78, 3.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.79, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.54] s</li>
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
<li>Exec time: [2.42, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.39, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.63, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.63, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.62, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.62, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.63, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.86, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.77] s</li>
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
<li>Exec time: [2.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.46, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.54] s</li>
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
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [2.44, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.62, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.61, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.63, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.62, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.63, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.63, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
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
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.56] s</li>
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
<li>Exec time: [2.44, 2.55] s</li>
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
<li>Exec time: [2.42, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.59, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.38] s</li>
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
<li>Exec time: [0.01, 0.02] s</li>
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
<li>Exec time: [2.61, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
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
<li>Exec time: [2.63] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.82] s</li>
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
<li>Exec time: [2.72, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.67, 2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.84, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.84, 3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.64] s</li>
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
<li>Exec time: [2.83, 3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.06, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 2.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
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
<li>Exec time: [1.33, 2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 3.12] s</li>
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
<li>Exec time: [2.58] s</li>
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
<li>Exec time: [2.74, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 2.82] s</li>
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
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [2.71, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.73, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.79, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.80, 3.66] s</li>
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
<li>Exec time: [2.81, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.78, 3.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 2.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 2.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
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
<li>Exec time: [1.33, 2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 2.81] s</li>
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
<li>Exec time: [2.72, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.73, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.71, 2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.75, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [2.71, 2.83] s</li>
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
<li>Exec time: [2.81, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.81, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
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
<li>Exec time: [2.80, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.82, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
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
<li>Exec time: [1.33, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.32, 2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.80] s</li>
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
<li>Exec time: [2.83] s</li>
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
<li>Exec time: [0.02] s</li>
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
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
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
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.54, 4.66] s</li>
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
<li>Exec time: [4.56, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.82] s</li>
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
<li>Exec time: [4.05, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.36, 4.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.12] s</li>
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
<li>Exec time: [4.42] s</li>
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
<li>Exec time: [4.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.66] s</li>
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
<li>Exec time: [4.54, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.02, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.02, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.01, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
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
<li>Exec time: [4.01, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.06, 5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.70] s</li>
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
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [4.57, 4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
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
<li>Exec time: [4.57, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.00, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 5.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
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
<li>Exec time: [4.01, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
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
<p>igt@kms_cursor_crc@cursor-rapid-movement:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.33, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.33, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.51] s</li>
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
<li>Exec time: [0.33, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.32] s</li>
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
<li>Exec time: [1.28, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
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
<li>Exec time: [0.19, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.87] s</li>
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
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [0.35, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.26, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.25, 1.35] s</li>
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
<li>Exec time: [1.25, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02] s</li>
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
<li>Exec time: [1.28, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.22, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.17, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
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
<li>Exec time: [0.20, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 0.54] s</li>
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
<li>Exec time: [0.37, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.35, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.37, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
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
<li>Exec time: [0.35, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.34] s</li>
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
<li>Exec time: [1.27, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.10] s</li>
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
<li>Exec time: [0.17, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 0.62] s</li>
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
<li>Exec time: [1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.28] s</li>
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
<li>Exec time: [1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
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
<li>Exec time: [0.02] s</li>
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
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.18] s</li>
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
<li>Exec time: [0.68, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 1.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.62, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.46, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.43, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.39, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.39, 4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.39, 4.49] s</li>
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
<li>Exec time: [4.39, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.32, 4.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.93, 5.31] s</li>
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
<li>Exec time: [3.90, 5.31] s</li>
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
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.20, 4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.16, 4.74] s</li>
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
<li>Exec time: [4.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.40, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.42, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.39, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.40, 4.47] s</li>
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
<li>Exec time: [0.02, 0.05] s</li>
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
<li>Exec time: [4.38, 4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.89, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.92, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
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
<li>Exec time: [3.95, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.93, 5.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 4.49] s</li>
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
<li>Exec time: [4.41, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.38, 4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.40, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.41, 4.50] s</li>
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
<li>Exec time: [0.02, 0.05] s</li>
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
<li>Exec time: [4.38, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.40, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.94, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.92, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.95, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
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
<li>Exec time: [3.91, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.91, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.16, 4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
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
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [3.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.91, 3.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.63, 5.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.26, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.03, 3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.34, 6.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.13, 3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.35, 6.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7300_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555] / [i915#5325])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-snb6/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk3/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#6141])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb8/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb6/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb7/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb4/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-apl8/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl8/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk8/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#5566] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-snb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#109271]) +154 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb5/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb7/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb1/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> ([i915#5903])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl4/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> ([i915#180])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-kbl3/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([i915#5286]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-glk7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk9/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html">FAIL</a> ([i915#1888] / [i915#5046])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb3/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_ccs@pipe-d-bad-pixel-format-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb1/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb7/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb8/igt@kms_chamelium@vga-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk9/igt@kms_chamelium@vga-frame-dump.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb6/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-snb2/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-kbl4/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl3/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-tglb2/igt@kms_content_protection@srm.html">SKIP</a> ([i915#1063])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb5/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-apl8/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10.html">SKIP</a> ([fdo#109271]) +149 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-glk1/igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512.html">SKIP</a> ([fdo#109271]) +95 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6523/shard-iclb6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7300/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#5072])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; [SKIP][73] ([fdo#109274] / [fdo#109278]) +1</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0499429971117592355==--
