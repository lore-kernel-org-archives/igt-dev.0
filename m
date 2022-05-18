Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1055148148268683348=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Wed, 18 May 2022 02:03:59 -0000
Message-ID: <165283943906.21389.6381006252899330007@emeril.freedesktop.org>
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_IGT_test_cleanup_=28rev3=29?=
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

--===============1055148148268683348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: IGT test cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/104029/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11664_full -> IGTPW_7120_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7120_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x32} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +36 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-iclb8/igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x32.html

  * {igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][2] +32 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglu-2/igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512.html

  * {igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +32 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglb5/igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_color@deep-color}:
    - shard-tglb:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglb6/igt@kms_color@deep-color.html

  * {igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions}:
    - shard-iclb:         NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * {igt@kms_cursor_legacy@short-busy-flip-before-cursor}:
    - shard-iclb:         NOTRUN -> [SKIP][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-iclb5/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - {shard-tglu}:       [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/shard-tglu-3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglu-1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11664_full and IGTPW_7120_full:

### New IGT tests (862) ###

  * igt@kms_color@ctm-0-25@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.49] s

  * igt@kms_color@ctm-0-25@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.58, 0.74] s

  * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_color@ctm-0-25@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-0-25@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.59] s

  * igt@kms_color@ctm-0-25@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.37, 1.52] s

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-0-25@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-0-25@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.60] s

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.53] s

  * igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-0-25@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@ctm-0-50@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@ctm-0-50@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.74] s

  * igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.50, 0.79] s

  * igt@kms_color@ctm-0-50@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-0-50@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.59] s

  * igt@kms_color@ctm-0-50@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.49] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_color@ctm-0-50@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-0-50@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-0-50@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.59] s

  * igt@kms_color@ctm-0-50@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.56] s

  * igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.58] s

  * igt@kms_color@ctm-0-50@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.44] s

  * igt@kms_color@ctm-0-75@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.48] s

  * igt@kms_color@ctm-0-75@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.63, 0.69] s

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.82] s

  * igt@kms_color@ctm-0-75@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-0-75@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@ctm-0-75@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.45] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@ctm-0-75@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-0-75@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.59] s

  * igt@kms_color@ctm-0-75@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.47] s

  * igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.63] s

  * igt@kms_color@ctm-0-75@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.45, 0.47] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.58, 0.71] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.81] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.60] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.49] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.59] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.45] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.58] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_color@ctm-max@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_color@ctm-max@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.70] s

  * igt@kms_color@ctm-max@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.77] s

  * igt@kms_color@ctm-max@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-max@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-max@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.48] s

  * igt@kms_color@ctm-max@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_color@ctm-max@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-max@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-max@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.47] s

  * igt@kms_color@ctm-max@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.58] s

  * igt@kms_color@ctm-max@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@ctm-negative@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47] s

  * igt@kms_color@ctm-negative@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.58, 0.71] s

  * igt@kms_color@ctm-negative@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.81] s

  * igt@kms_color@ctm-negative@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-negative@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.60] s

  * igt@kms_color@ctm-negative@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.38, 1.49] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_color@ctm-negative@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-negative@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-negative@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.60] s

  * igt@kms_color@ctm-negative@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.47] s

  * igt@kms_color@ctm-negative@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.57] s

  * igt@kms_color@ctm-negative@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.35] s

  * igt@kms_color@ctm-negative@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_color@ctm-red-to-blue:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.46, 0.48] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.70] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.80] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.59] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.33, 1.50] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.59] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.45] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.57] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.22] s

  * igt@kms_color@degamma@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.52] s

  * igt@kms_color@degamma@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.58, 0.70] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_color@degamma@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.65] s

  * igt@kms_color@degamma@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.36, 1.50] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@degamma@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.64] s

  * igt@kms_color@degamma@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.47] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@degamma@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@gamma@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@gamma@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_color@gamma@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_color@gamma@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@gamma@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_color@gamma@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.36] s

  * igt@kms_color@gamma@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_color@gamma@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_color@invalid-ctm-matrix-sizes@pipe-a:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_color@invalid-ctm-matrix-sizes@pipe-b:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@kms_color@invalid-ctm-matrix-sizes@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color@invalid-ctm-matrix-sizes@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.01] s

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-a:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.34] s

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-b:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@invalid-gamma-lut-sizes:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.08, 0.11] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 0.40] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.07, 0.46] s

  * igt@kms_color@legacy-gamma-reset@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.07] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_color@legacy-gamma@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.49, 0.52] s

  * igt@kms_color@legacy-gamma@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.57, 0.69] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.23, 0.84] s

  * igt@kms_color@legacy-gamma@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_color@legacy-gamma@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.65] s

  * igt@kms_color@legacy-gamma@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 1.50] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_color@legacy-gamma@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_color@legacy-gamma@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.51, 0.64] s

  * igt@kms_color@legacy-gamma@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 1.46] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.61] s

  * igt@kms_color@legacy-gamma@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48, 0.69] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.76, 0.85] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 0.94] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.42, 0.52] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.40] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.52] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.54] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.41] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.52] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.38, 0.48] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.62] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.21, 0.82] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.34] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.43, 0.53] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.30, 1.40] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 0.51] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.31] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.44, 0.54] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.29, 1.40] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.52] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.28] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.54] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.79] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.24] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.80] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.97] s

  * igt@kms_cursor_crc@cursor-dpms@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.26] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.54] s

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
    - Exec time: [2.43, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.37, 2.48] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.37] s

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
    - Exec time: [2.64, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.86, 2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.21, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.82] s

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
    - Exec time: [2.33] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.41, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.43, 2.54] s

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
    - Exec time: [2.43, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.37] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 3.36] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.50] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 2.52] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.49] s

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
    - Exec time: [2.44, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.42, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.44, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

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
    - Exec time: [2.44, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.45, 2.57] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.64, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.39] s

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
    - Exec time: [2.62, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.62, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 2.53] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [1.19, 2.55] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.57] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.07] s

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
    - Exec time: [1.20, 2.54] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.20, 2.56] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.62] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

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
    - Exec time: [2.62] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [1.20] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

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
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.84] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.78] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.66] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.88] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.86] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.10] s

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
    - Exec time: [2.57] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.79] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.63] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.67] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.86] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.89] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

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
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.81] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.84] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.83] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.66] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.80] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.87] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.85] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.84] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.82] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.86] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.56, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.54, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.54, 4.64] s

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
    - Exec time: [4.55, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.49, 4.58] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 5.45] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.07, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 5.48] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.48] s

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
    - Exec time: [4.05, 5.48] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 4.75] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 4.71] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 4.62] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 4.93] s

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
    - Exec time: [4.40] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.63] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.04] s

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
    - Exec time: [4.58, 4.63] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.62] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.02, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.99, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

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
    - Exec time: [4.02, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.01, 5.47] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.61] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.61] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.67] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.63] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 4.61] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.63] s

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
    - Exec time: [4.55, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.57, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.59, 4.66] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.55, 4.66] s

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
    - Exec time: [4.61, 4.64] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.58, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [4.02, 5.47] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.48] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [4.04, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01, 0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [4.03, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [4.05, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.68] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.63] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.25, 4.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.10] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.02, 0.11] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.27, 4.62] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.26, 4.61] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.99] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

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
    - Exec time: [4.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [2.26] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [2.25] s

  * igt@kms_cursor_crc@cursor-rapid-movement:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.68] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.65, 0.86] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 1.0] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.67, 0.71] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.59] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.70] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.64, 0.72] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.63] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.71] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.40] s

  * igt@kms_cursor_crc@cursor-size-change@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.02] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.51] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.46] s

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
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.05] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.45] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

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
    - Exec time: [4.58] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.49] s

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
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.48] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.49] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.06] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.50] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [2.71, 4.03] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.44, 5.05] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.95, 6.73] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.71] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.63, 3.35] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [5.00, 5.64] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.72, 3.35] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.47] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - Statuses : 1 dmesg-warn(s) 1 pass(s)
    - Exec time: [2.53, 3.43] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [4.97, 5.49] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [2.80, 6.26] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [5.70] s

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.75] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.37] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.33, 3.49] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 4.29] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.49, 4.62] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.41] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.73] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.30] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.28] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.33] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.19, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.50, 4.53] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.39] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.79] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.31] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.37] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.34, 3.52] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.52, 4.61] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.62, 3.40] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.40] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.68, 3.76] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.26] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.29, 3.36] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.28, 3.37] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.34, 3.54] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [3.20, 4.29] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 4.29] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [3.51, 4.58] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [1.63, 3.49] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [1.64, 3.45] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [1.67, 3.88] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.32] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic:
    - Statuses : 3 pass(s)
    - Exec time: [29.82, 37.84] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions:
    - Statuses : 3 pass(s)
    - Exec time: [30.06, 37.60] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:
    - Statuses : 3 pass(s)
    - Exec time: [31.93, 41.57] s

  * igt@kms_cursor_legacy@cursor-vs-flip@legacy:
    - Statuses : 3 pass(s)
    - Exec time: [30.00, 37.53] s

  * igt@kms_cursor_legacy@cursor-vs-flip@toggle:
    - Statuses : 3 pass(s)
    - Exec time: [31.70, 41.65] s

  * igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
    - Statuses : 3 pass(s)
    - Exec time: [31.66, 41.65] s

  * igt@kms_cursor_legacy@cursora-vs-flipa:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursora-vs-flipb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 11.40] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 11.42] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 11.34] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 11.31] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@toggle:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 11.32] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@varying-size:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 11.40] s

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - Statuses : 7 pass(s)
    - Exec time: [21.51, 21.56] s

  * igt@kms_cursor_legacy@forked-bo@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [21.51, 21.55] s

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [21.51, 21.56] s

  * igt@kms_cursor_legacy@forked-bo@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [21.50, 21.54] s

  * igt@kms_cursor_legacy@forked-bo@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [21.51, 21.52] s

  * igt@kms_cursor_legacy@forked-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic:
    - Statuses : 7 pass(s)
    - Exec time: [0.96, 2.04] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions:
    - Statuses : 7 pass(s)
    - Exec time: [0.99, 2.05] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions-varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [0.99, 2.05] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@legacy:
    - Statuses : 7 pass(s)
    - Exec time: [0.92, 1.31] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@toggle:
    - Statuses : 7 pass(s)
    - Exec time: [0.96, 2.05] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [0.96, 2.06] s

  * igt@kms_cursor_legacy@single-bo@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [21.48, 21.49] s

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - Statuses : 7 pass(s)
    - Exec time: [21.48, 21.51] s

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [21.48, 21.52] s

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [21.48, 21.51] s

  * igt@kms_cursor_legacy@single-move@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [21.48, 21.50] s

  * igt@kms_cursor_legacy@single-move@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [21.48, 21.49] s

  * igt@kms_cursor_legacy@torture-bo:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@torture-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-dp-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.18, 0.23] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1:
    - Statuses : 2 skip(s)
    - Exec time: [1.19, 1.21] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:
    - Statuses : 2 skip(s)
    - Exec time: [0.04, 0.46] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.21] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.52, 0.65] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.76] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.30] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.31, 1.41] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.20, 0.53] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.29] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.20] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.57] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.35] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.69] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.68] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.75] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.88] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.60] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.39, 1.49] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.54, 0.60] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.47] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.60] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.33] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.55, 0.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.80] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.95] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.67] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.43, 1.56] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.68] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.42, 1.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.26, 0.71] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.56, 0.57] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.66, 0.80] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 0.95] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.61, 0.66] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.60, 0.68] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.41, 1.55] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.27, 0.70] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.45] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.63] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.50] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.50] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.59, 0.71] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 0.86] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.60] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.35, 1.49] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.62] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.41] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.53, 0.61] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.47] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.22, 0.59] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.36] s

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.23] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.99, 2.40] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.21, 3.52] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.76, 4.26] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.69] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.97] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [3.78, 4.05] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.73] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.42] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.78] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.93] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - Statuses : 2 pass(s)

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html

--===============1055148148268683348==
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
<tr><td><b>Series:</b></td><td>tests/kms: IGT test cleanup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104029/">https://patchwork.freedesktop.org/series/104029/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11664_full -&gt; IGTPW_7120_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7120_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x32} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-iclb8/igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-32x32.html">SKIP</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglu-2/igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512.html">SKIP</a> +32 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglb5/igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-32x32.html">SKIP</a> +32 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_color@deep-color}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglb6/igt@kms_color@deep-color.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@short-busy-flip-before-cursor}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-iclb5/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11664/shard-tglu-3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7120/shard-tglu-1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11664_full and IGTPW_7120_full:</p>
<h3>New IGT tests (862)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.58, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.37, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50, 0.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.44, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.63, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.45, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.58, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.58, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.38, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.46, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.33, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.58, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.36, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-degamma-lut-sizes@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.08, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.07, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.49, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.57, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.23, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.51, 0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.76, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 0.94] s</li>
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
<li>Exec time: [0.42, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.52] s</li>
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
<li>Exec time: [0.44, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.52] s</li>
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
<li>Exec time: [0.38, 0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.21, 0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.43, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.30, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 0.51] s</li>
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
<li>Exec time: [0.44, 0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.29, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.52] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.54] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.43, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.54] s</li>
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
<li>Exec time: [2.43, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.37, 2.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.37] s</li>
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
<li>Exec time: [2.64, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.86, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.21, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
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
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.82] s</li>
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
<li>Exec time: [2.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.41, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.56] s</li>
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
<li>Exec time: [2.43, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 3.38] s</li>
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
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
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
<li>Exec time: [2.61, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 2.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [1.20, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.49] s</li>
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
<li>Exec time: [2.44, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.42, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.44, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [2.44, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.45, 2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.64, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.39] s</li>
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
<li>Exec time: [2.62, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.62, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.19, 2.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.57] s</li>
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
<li>Exec time: [0.02, 0.07] s</li>
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
<li>Exec time: [1.20, 2.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.20, 2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.62] s</li>
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
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [2.62] s</li>
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
<li>Exec time: [1.21] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.10] s</li>
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
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.56, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.54, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.54, 4.64] s</li>
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
<li>Exec time: [4.55, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.49, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 5.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.07, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.48] s</li>
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
<li>Exec time: [4.05, 5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 4.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 4.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 4.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 4.93] s</li>
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
<li>Exec time: [4.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.64] s</li>
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
<li>Exec time: [4.55, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.55, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
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
<li>Exec time: [4.58, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.62] s</li>
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
<li>Exec time: [4.02, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.99, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.03, 5.51] s</li>
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
<li>Exec time: [4.02, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.01, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.63] s</li>
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
<li>Exec time: [4.55, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.57, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.59, 4.66] s</li>
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
<li>Exec time: [4.61, 4.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.58, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.04, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.02, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.48] s</li>
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
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [4.03, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.05, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.25, 4.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.02, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.27, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.26, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
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
<li>Exec time: [0.01] s</li>
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
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-edp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.25] s</li>
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
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.65, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 1.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.67, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.70] s</li>
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
<li>Exec time: [0.64, 0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-change@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.40] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
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
<li>Exec time: [4.46] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-dp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
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
<li>Exec time: [4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
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
<li>Exec time: [4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.49] s</li>
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
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-dp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.06] s</li>
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
<li>Exec time: [4.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [2.71, 4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.44, 5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.95, 6.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.63, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.00, 5.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.72, 3.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 1 pass(s)</li>
<li>Exec time: [2.53, 3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.97, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.80, 6.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.33, 3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.49, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.19, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.50, 4.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.34, 3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.52, 4.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.62, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.68, 3.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.29, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.28, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-dp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.34, 3.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.20, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-edp-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.51, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.63, 3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.64, 3.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-hdmi-a-1-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.67, 3.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-vga-1-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [29.82, 37.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [30.06, 37.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [31.93, 41.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@legacy:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [30.00, 37.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@toggle:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [31.70, 41.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@varying-size:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [31.66, 41.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 11.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 11.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 11.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 11.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@toggle:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 11.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 11.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.51, 21.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.51, 21.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.51, 21.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [21.50, 21.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [21.51, 21.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.96, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.99, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.99, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@legacy:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.92, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@toggle:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.96, 2.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@varying-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.96, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [21.48, 21.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.48, 21.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.48, 21.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.48, 21.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [21.48, 21.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [21.48, 21.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.18, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [1.19, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.04, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.52, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.31, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.20, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.39, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.54, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.55, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.43, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.42, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.56, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.66, 0.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.61, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.44, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.60, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.41, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.27, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.59, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.35, 1.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.53, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.22, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.99, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.21, 3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.76, 4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.78, 4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1055148148268683348==--
