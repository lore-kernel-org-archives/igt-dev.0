Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0643680205272454373=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Wed, 11 May 2022 18:27:02 -0000
Message-ID: <165229362230.2697.10619726589856287120@emeril.freedesktop.org>
References: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQ29udmVy?=
 =?utf-8?q?t_subtests_to_dynamic_=28rev5=29?=
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

--===============0643680205272454373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert subtests to dynamic (rev5)
URL   : https://patchwork.freedesktop.org/series/103734/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11631_full -> IGTPW_7076_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.html

Participating hosts (10 -> 8)
------------------------------

  Additional (1): shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7076_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@cursor-random@pipe-c-512x512} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +59 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_cursor_crc@cursor-random@pipe-c-512x512.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-512x170} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][2] +47 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-512x170.html

  * {igt@kms_cursor_crc@cursor-sliding@pipe-a-32x32} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +63 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_cursor_crc@cursor-sliding@pipe-a-32x32.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_color@deep-color}:
    - shard-tglb:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_color@deep-color.html
    - {shard-tglu}:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglu-4/igt@kms_color@deep-color.html

  * {igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size}:
    - shard-glk:          NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * {igt@kms_cursor_legacy@short-busy-flip-before-cursor}:
    - shard-iclb:         NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb5/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11631_full and IGTPW_7076_full:

### New IGT tests (312) ###

  * igt@kms_color@ctm-0-25@pipe-a:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_color@ctm-0-25@pipe-b:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.12] s

  * igt@kms_color@ctm-0-25@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.36, 1.14] s

  * igt@kms_color@ctm-0-25@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 1.02] s

  * igt@kms_color@ctm-0-50@pipe-a:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@kms_color@ctm-0-50@pipe-b:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.17] s

  * igt@kms_color@ctm-0-50@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.39, 1.12] s

  * igt@kms_color@ctm-0-75@pipe-a:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@kms_color@ctm-0-75@pipe-b:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_color@ctm-0-75@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.39, 1.11] s

  * igt@kms_color@ctm-blue-to-red@pipe-a:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@kms_color@ctm-blue-to-red@pipe-b:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_color@ctm-blue-to-red@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.36, 1.18] s

  * igt@kms_color@ctm-blue-to-red@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.36, 1.02] s

  * igt@kms_color@ctm-green-to-red@pipe-a:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_color@ctm-green-to-red@pipe-b:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_color@ctm-green-to-red@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.36, 1.12] s

  * igt@kms_color@ctm-green-to-red@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.02] s

  * igt@kms_color@ctm-max@pipe-a:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.66] s

  * igt@kms_color@ctm-max@pipe-b:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.16] s

  * igt@kms_color@ctm-max@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.40, 1.12] s

  * igt@kms_color@ctm-max@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.04] s

  * igt@kms_color@ctm-negative@pipe-a:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_color@ctm-negative@pipe-b:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.12] s

  * igt@kms_color@ctm-negative@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.19, 1.12] s

  * igt@kms_color@ctm-negative@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_color@ctm-red-to-blue:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_color@ctm-red-to-blue@pipe-a:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@kms_color@ctm-red-to-blue@pipe-b:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.17] s

  * igt@kms_color@ctm-red-to-blue@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.18, 1.11] s

  * igt@kms_color@ctm-red-to-blue@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 1.02] s

  * igt@kms_color@degamma@pipe-a:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.84] s

  * igt@kms_color@degamma@pipe-b:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@kms_color@degamma@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.20, 1.54] s

  * igt@kms_color@degamma@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.19, 1.34] s

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
    - Exec time: [0.0, 0.32] s

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-b:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@invalid-degamma-lut-sizes@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@invalid-gamma-lut-sizes:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.34] s

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-b:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma-reset@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.06, 0.46] s

  * igt@kms_color@legacy-gamma-reset@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@kms_color@legacy-gamma-reset@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@kms_color@legacy-gamma@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.32, 0.70] s

  * igt@kms_color@legacy-gamma@pipe-b:
    - Statuses : 6 pass(s)
    - Exec time: [0.35, 1.19] s

  * igt@kms_color@legacy-gamma@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.41, 1.18] s

  * igt@kms_color@legacy-gamma@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-128x128:
    - Statuses : 7 pass(s)
    - Exec time: [2.33, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-128x42:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-256x256:
    - Statuses : 7 pass(s)
    - Exec time: [2.33, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-256x85:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-32x10:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-32x32:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-512x170:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-512x512:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-64x21:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-a-64x64:
    - Statuses : 7 pass(s)
    - Exec time: [2.53, 3.46] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-128x128:
    - Statuses : 7 pass(s)
    - Exec time: [2.33, 3.37] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-128x42:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-256x256:
    - Statuses : 7 pass(s)
    - Exec time: [2.33, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-256x85:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-32x10:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-32x32:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.06] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-512x170:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-512x512:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-64x21:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-b-64x64:
    - Statuses : 7 pass(s)
    - Exec time: [2.33, 3.36] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-128x128:
    - Statuses : 6 pass(s)
    - Exec time: [2.44, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-128x42:
    - Statuses : 6 pass(s)
    - Exec time: [2.44, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-256x256:
    - Statuses : 6 pass(s)
    - Exec time: [2.42, 3.40] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-256x85:
    - Statuses : 6 pass(s)
    - Exec time: [2.43, 3.38] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-32x10:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-32x32:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-512x170:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-512x512:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-64x21:
    - Statuses : 6 pass(s)
    - Exec time: [2.45, 3.39] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-c-64x64:
    - Statuses : 6 pass(s)
    - Exec time: [2.45, 3.41] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 2.62] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.61] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.60, 2.63] s

  * igt@kms_cursor_crc@cursor-offscreen@pipe-d-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.61, 2.62] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-128x128:
    - Statuses : 4 pass(s)
    - Exec time: [2.57, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-128x42:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-256x256:
    - Statuses : 4 pass(s)
    - Exec time: [2.58, 3.66] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-256x85:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-32x10:
    - Statuses : 4 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-32x32:
    - Statuses : 4 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-512x170:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-512x512:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-64x21:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-a-64x64:
    - Statuses : 4 pass(s)
    - Exec time: [2.62, 3.53] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-128x128:
    - Statuses : 4 pass(s)
    - Exec time: [2.58, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-128x42:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-256x256:
    - Statuses : 4 pass(s)
    - Exec time: [2.58, 3.63] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-256x85:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-32x10:
    - Statuses : 4 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-32x32:
    - Statuses : 4 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-512x170:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-512x512:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-64x21:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.01, 3.64] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-b-64x64:
    - Statuses : 4 pass(s)
    - Exec time: [2.58, 3.63] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-128x128:
    - Statuses : 3 pass(s)
    - Exec time: [2.76, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-128x42:
    - Statuses : 3 pass(s)
    - Exec time: [2.81, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-256x256:
    - Statuses : 3 pass(s)
    - Exec time: [2.80, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-256x85:
    - Statuses : 3 pass(s)
    - Exec time: [2.83, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-32x10:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-32x32:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-512x170:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-512x512:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-64x21:
    - Statuses : 3 pass(s)
    - Exec time: [2.83, 3.65] s

  * igt@kms_cursor_crc@cursor-onscreen@pipe-c-64x64:
    - Statuses : 3 pass(s)
    - Exec time: [2.82, 3.65] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-128x128:
    - Statuses : 5 pass(s)
    - Exec time: [4.02, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-128x42:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.48] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-256x256:
    - Statuses : 5 pass(s)
    - Exec time: [4.05, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-256x85:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-32x10:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-32x32:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-512x170:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-512x512:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-64x21:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.49] s

  * igt@kms_cursor_crc@cursor-random@pipe-a-64x64:
    - Statuses : 5 pass(s)
    - Exec time: [3.95, 5.39] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-128x128:
    - Statuses : 5 pass(s)
    - Exec time: [4.01, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-128x42:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-256x256:
    - Statuses : 5 pass(s)
    - Exec time: [4.00, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-256x85:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-32x10:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-32x32:
    - Statuses : 5 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-512x170:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-512x512:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-64x21:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-b-64x64:
    - Statuses : 5 pass(s)
    - Exec time: [4.01, 5.47] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-128x128:
    - Statuses : 4 pass(s)
    - Exec time: [4.02, 5.52] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-128x42:
    - Statuses : 4 pass(s)
    - Exec time: [4.03, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-256x256:
    - Statuses : 4 pass(s)
    - Exec time: [4.04, 5.51] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-256x85:
    - Statuses : 4 pass(s)
    - Exec time: [4.03, 5.52] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-32x10:
    - Statuses : 4 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-32x32:
    - Statuses : 4 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-512x170:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-512x512:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-64x21:
    - Statuses : 4 pass(s)
    - Exec time: [4.02, 5.50] s

  * igt@kms_cursor_crc@cursor-random@pipe-c-64x64:
    - Statuses : 4 pass(s)
    - Exec time: [4.02, 5.48] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-128x42:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [4.04] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-256x85:
    - Statuses : 1 pass(s)
    - Exec time: [4.03] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-32x10:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-32x32:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-512x170:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-512x512:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-64x21:
    - Statuses : 1 pass(s)
    - Exec time: [4.06] s

  * igt@kms_cursor_crc@cursor-random@pipe-d-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [4.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-128x128:
    - Statuses : 7 pass(s)
    - Exec time: [0.18, 1.31] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-128x42:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.29] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-256x256:
    - Statuses : 7 pass(s)
    - Exec time: [0.16, 1.33] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-256x85:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.29] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-32x10:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-32x32:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-512x170:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-512x512:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-64x21:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-64x64:
    - Statuses : 7 pass(s)
    - Exec time: [0.14, 1.19] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-128x128:
    - Statuses : 7 pass(s)
    - Exec time: [0.17, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-128x42:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-256x256:
    - Statuses : 7 pass(s)
    - Exec time: [0.17, 1.36] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-256x85:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.33] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-32x10:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-32x32:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.05] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-512x170:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-512x512:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-64x21:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-64x64:
    - Statuses : 7 pass(s)
    - Exec time: [0.18, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-128x128:
    - Statuses : 6 pass(s)
    - Exec time: [0.18, 1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-128x42:
    - Statuses : 6 pass(s)
    - Exec time: [0.16, 1.31] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-256x256:
    - Statuses : 6 pass(s)
    - Exec time: [0.16, 1.31] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-256x85:
    - Statuses : 6 pass(s)
    - Exec time: [0.16, 1.30] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-32x10:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-32x32:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-512x170:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-512x512:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-64x21:
    - Statuses : 6 pass(s)
    - Exec time: [0.18, 1.32] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-64x64:
    - Statuses : 6 pass(s)
    - Exec time: [0.16, 1.34] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 1.29] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [0.16, 1.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [0.18, 1.28] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-128x128:
    - Statuses : 7 pass(s)
    - Exec time: [2.18, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-128x42:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-256x256:
    - Statuses : 7 pass(s)
    - Exec time: [2.17, 5.30] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-256x85:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.02, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-32x10:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-32x32:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-512x170:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-512x512:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-64x21:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-64x64:
    - Statuses : 7 pass(s)
    - Exec time: [2.17, 5.33] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-128x128:
    - Statuses : 7 pass(s)
    - Exec time: [2.17, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-128x42:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.33] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-256x256:
    - Statuses : 7 pass(s)
    - Exec time: [2.17, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-256x85:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.33] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-32x10:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-32x32:
    - Statuses : 7 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-512x170:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-512x512:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-64x21:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.01, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-b-64x64:
    - Statuses : 7 pass(s)
    - Exec time: [2.17, 5.30] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-128x128:
    - Statuses : 6 pass(s)
    - Exec time: [2.16, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-128x42:
    - Statuses : 6 pass(s)
    - Exec time: [2.16, 5.30] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-256x256:
    - Statuses : 6 pass(s)
    - Exec time: [2.16, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-256x85:
    - Statuses : 6 pass(s)
    - Exec time: [2.16, 5.32] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-32x10:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-32x32:
    - Statuses : 6 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-512x170:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-512x512:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-64x21:
    - Statuses : 6 pass(s)
    - Exec time: [2.16, 5.31] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-64x64:
    - Statuses : 6 pass(s)
    - Exec time: [2.17, 5.29] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-128x128:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.91] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-128x42:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.92] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-256x256:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.90] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-256x85:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.90] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-32x10:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-32x32:
    - Statuses : 2 skip(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-512x170:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-512x512:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-64x21:
    - Statuses : 2 pass(s)
    - Exec time: [2.18, 3.92] s

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-64x64:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.91] s

  * igt@kms_cursor_edge_walk@left-edge:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-128x128:
    - Statuses : 6 pass(s)
    - Exec time: [3.20, 4.31] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-256x256:
    - Statuses : 6 pass(s)
    - Exec time: [3.20, 4.26] s

  * igt@kms_cursor_edge_walk@left-edge@pipe-a-64x64:
    - Statuses : 6 pass(s)
    - Exec time: [3.31, 4.58] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-128x128:
    - Statuses : 7 pass(s)
    - Exec time: [1.63, 4.29] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-256x256:
    - Statuses : 7 pass(s)
    - Exec time: [1.63, 4.28] s

  * igt@kms_cursor_edge_walk@right-edge@pipe-a-64x64:
    - Statuses : 7 pass(s)
    - Exec time: [1.69, 4.57] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-128x128:
    - Statuses : 6 pass(s)
    - Exec time: [3.21, 4.27] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-256x256:
    - Statuses : 6 pass(s)
    - Exec time: [3.19, 4.27] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-a-64x64:
    - Statuses : 6 pass(s)
    - Exec time: [3.32, 4.62] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-128x128:
    - Statuses : 6 pass(s)
    - Exec time: [1.64, 4.29] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-256x256:
    - Statuses : 6 pass(s)
    - Exec time: [1.63, 4.28] s

  * igt@kms_cursor_edge_walk@top-edge@pipe-a-64x64:
    - Statuses : 6 pass(s)
    - Exec time: [1.69, 4.56] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_cursor_legacy@basic-flip-after-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic:
    - Statuses : 7 pass(s)
    - Exec time: [27.92, 37.43] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions:
    - Statuses : 7 pass(s)
    - Exec time: [28.25, 38.12] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [29.11, 42.20] s

  * igt@kms_cursor_legacy@cursor-vs-flip@legacy:
    - Statuses : 7 pass(s)
    - Exec time: [27.96, 38.02] s

  * igt@kms_cursor_legacy@cursor-vs-flip@toggle:
    - Statuses : 7 pass(s)
    - Exec time: [28.78, 41.73] s

  * igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [28.75, 41.75] s

  * igt@kms_cursor_legacy@cursora-vs-flipa:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursora-vs-flipb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@forked-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@short-flip-after-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic:
    - Statuses : 7 pass(s)
    - Exec time: [0.47, 0.96] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions:
    - Statuses : 7 pass(s)
    - Exec time: [0.47, 0.98] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions-varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [0.47, 0.98] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@legacy:
    - Statuses : 7 pass(s)
    - Exec time: [0.47, 1.18] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@toggle:
    - Statuses : 7 pass(s)
    - Exec time: [0.46, 0.93] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [0.46, 0.94] s

  * igt@kms_cursor_legacy@single-bo@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [21.48, 21.51] s

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - Statuses : 7 pass(s)
    - Exec time: [21.48, 21.51] s

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [21.48, 21.51] s

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [21.48, 21.50] s

  * igt@kms_cursor_legacy@single-move@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [21.48, 21.50] s

  * igt@kms_cursor_legacy@single-move@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [21.48] s

  * igt@kms_cursor_legacy@torture-bo:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@torture-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.24, 2.44] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.23, 0.71] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.25, 1.57] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.26, 1.55] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 1.41] s

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.27, 0.78] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.30, 1.58] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.29, 1.60] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.30, 1.46] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.25, 1.53] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.25, 1.41] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [1.68, 2.99] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b:
    - Statuses : 6 pass(s)
    - Exec time: [1.75, 4.09] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [1.87, 4.03] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [2.17, 3.71] s

  

Known issues
------------

  Here are the changes found in IGTPW_7076_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([fdo#111827])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#111827])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#658])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@feature_discovery@psr2.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271]) +218 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#5327]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#5325])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][14] ([i915#4991])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1099]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#280])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2846])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][20] ([i915#2842]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          NOTRUN -> [FAIL][21] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#2842]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109313])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109313])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-snb:          [PASS][28] -> [SKIP][29] ([fdo#109271]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-snb2/igt@gem_exec_flush@basic-wb-pro-default.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-snb6/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109283]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109283] / [i915#4877])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@gem_exec_params@no-vebox.html

  * igt@gem_huc_copy@huc-copy:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#2190])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#4613]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#4613]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl8/igt@gem_lmem_swapping@parallel-multi.html
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk7/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4613]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#284])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][41] ([i915#2658]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk5/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][42] ([i915#2658])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl7/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][44] ([i915#2658])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-snb2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][45] ([i915#2658]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#4270]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#4270]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +295 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#768]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-glk:          NOTRUN -> [FAIL][50] ([i915#4171])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk9/igt@gem_softpin@evict-single-offset.html
    - shard-apl:          NOTRUN -> [FAIL][51] ([i915#4171])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3297]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#3297]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109289]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109289]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#2527] / [i915#2856]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([i915#2856]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#1904])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][59] -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([i915#4281])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][63] -> [WARN][64] ([i915#2681])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#110892])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109506] / [i915#2411]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#4387])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#5723])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@i915_query@test-query-geometry-subslices.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#5723])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][72] ([i915#2373])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][73] ([i915#1759])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][74] ([i915#5591])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][75] ([i915#180])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3826])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3826])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#4765])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#1769])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#1769])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#5286]) +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#5286]) +7 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#110725] / [fdo#111614]) +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111614]) +7 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#110723]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#111615]) +5 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#2705]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#2705]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3689]) +10 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#3886]) +5 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278] / [i915#3886]) +7 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#3886]) +8 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#3886]) +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#111615] / [i915#3689]) +8 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#3689] / [i915#3886]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109278]) +21 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk7/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109284] / [fdo#111827]) +17 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.html
    - shard-snb:          NOTRUN -> [SKIP][102] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#3116] / [i915#3299]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#3116]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109300] / [fdo#111066]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@uevent:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#1063])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@kms_content_protection@uevent.html

  * {igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-256x85} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][108] ([fdo#109271]) +345 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-snb6/igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-256x85.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109274] / [fdo#111825]) +5 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#5287]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#5287]) +4 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109274]) +5 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-kbl:          NOTRUN -> [FAIL][113] ([i915#79])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-kbl:          [PASS][114] -> [INCOMPLETE][115] ([i915#3614])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][116] -> [DMESG-WARN][117] ([i915#180]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [PASS][118] -> [FAIL][119] ([i915#4911])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#2587])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#2587])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109280] / [fdo#111825]) +37 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#109280]) +38 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][124] -> [DMESG-WARN][125] ([i915#180]) +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][126] ([fdo#108145] / [i915#265])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][127] ([fdo#108145] / [i915#265]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][128] ([i915#265])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([i915#3536]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#3536])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([fdo#111615] / [fdo#112054]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#5288])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-4.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][133] ([i915#5288])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-tiling-4.html

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier:
    - shard-iclb:         NOTRUN -> [SKIP][134] ([i915#5176]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
    - shard-iclb:         NOTRUN -> [SKIP][135] ([i915#5235]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale:
    - shard-iclb:         [PASS][136] -> [SKIP][137] ([i915#5235]) +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][138] ([i915#2920]) +2 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#658]) +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][140] ([fdo#111068] / [i915#658]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][141] ([fdo#109271] / [i915#658]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#658])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][143] ([fdo#109441]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][144] ([i915#132] / [i915#3467]) +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][145] -> [SKIP][146] ([fdo#109441]) +2 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][147] ([i915#5030]) +3 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-tglb:         NOTRUN -> [SKIP][148] ([i915#3555]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-iclb:         NOTRUN -> [SKIP][149] ([i915#3555])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][150] ([IGT#2])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl8/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][151] ([IGT#2])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl7/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][152] ([fdo#109271]) +258 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl6/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-glk:          NOTRUN -> [SKIP][153] ([fdo#109271] / [i915#533])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][154] ([fdo#109271] / [i915#2437])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][155] ([i915#2530]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][156] ([i915#2530]) +3 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][157] -> [FAIL][158] ([i915#5639])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl2/igt@perf@polling-parameterized.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl6/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@nv_self_import_to_different_fd:
    - shard-tglb:         NOTRUN -> [SKIP][159] ([fdo#109291]) +5 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@prime_nv_api@nv_self_import_to_different_fd.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-iclb:         NOTRUN -> [SKIP][160] ([fdo#109291]) +5 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@prime_nv_pcopy@test3_3.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglb:         NOTRUN -> [SKIP][161] ([fdo#109295])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@prime_vgem@fence-write-hang.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-apl:          NOTRUN -> [DMESG-WARN][162] ([i915#5098])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl8/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][163] ([i915#2994]) +2 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@recycle:
    - shard-kbl:          NOTRUN -> [SKIP][164] ([fdo#109271] / [i915#2994]) +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][165] ([fdo#109271] / [i915#2994]) +1 similar issue
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         NOTRUN -> [SKIP][166] ([i915#2994]) +3 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb5/igt@sysfs_clients@recycle-many.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-iclb:         NOTRUN -> [SKIP][167] ([fdo#109307])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [DMESG-WARN][168] ([i915#180]) -> [PASS][169] +2 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][170] ([i915#2842]) -> [PASS][171] +2 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][172] ([i915#2842]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-snb:          [SKIP][174] ([fdo#109271]) -> [PASS][175] +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-snb6/igt@gem_exec_flush@basic-uc-set-default.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-snb5/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@i915_suspend@system-suspend-without-i915:
    - shard-snb:          [DMESG-WARN][176] -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-snb7/igt@i915_suspend@system-suspend-without-i915.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-snb4/igt@i915_suspend@system-suspend-without-i915.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         [FAIL][178] ([i915#3743]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-glk:          [FAIL][180] ([i915#4911]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][182] ([i915#180]) -> [PASS][183] +2 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [SKIP][184] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][186] ([fdo#109441]) -> [PASS][187] +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb7/igt@kms_psr@psr2_basic.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [SKIP][188] ([i915#5519]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [DMESG-WARN][190] ([i915#5614]) -> [SKIP][191] ([i915#4525])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         [SKIP][192] ([i915#4525]) -> [DMESG-WARN][193] ([i915#5614])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-tglb:         [SKIP][194] ([i915#2848]) -> [FAIL][195] ([i915#2842])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-glk:          [SKIP][196] ([fdo#109271]) -> [SKIP][197] ([fdo#109271] / [i915#1888])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-glk1/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][198] ([fdo#109274] / [fdo#109278]) -> [SKIP][199] ([fdo#109274]) +7 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][200], [FAIL][201], [FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205], [FAIL][206]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][207], [FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl3/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl2/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl6/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl2/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl6/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl7/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl1/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl8/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl8/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl7/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl6/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
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
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2848]: https://gitlab.freedesktop.org/drm/intel/issues/2848
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
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
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6471 -> IGTPW_7076
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11631: 410072c9a105aa0f2d37b8793ae5e5b43f6fa066 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7076: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.html
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.html

--===============0643680205272454373==
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
<tr><td><b>Series:</b></td><td>Convert subtests to dynamic (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/103734/">https://patchwork.freedesktop.org/series/103734/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7076/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11631_full -&gt; IGTPW_7076_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.=
html</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Additional (1): shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7076=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@cursor-random@pipe-c-512x512} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_cursor_crc@cursor-random@pipe-=
c-512x512.html">SKIP</a> +59 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-512x170} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglu-4/igt@kms_cursor_crc@cursor-rapid-movem=
ent@pipe-d-512x170.html">SKIP</a> +47 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-sliding@pipe-a-32x32} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_cursor_crc@cursor-sliding@pipe=
-a-32x32.html">SKIP</a> +63 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_color@deep-color}:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_color@deep-color.html">SKIP</a>=
</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglu-4/igt@kms_color@deep-color.html">SKIP</a=
></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size}:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@at=
omic-transitions-varying-size.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@short-busy-flip-before-cursor}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb5/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11631_full and IGTPW_7076_=
full:</p>
<h3>New IGT tests (312)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.36, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.39, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-b:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.39, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.36, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.36, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.36, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.40, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.19, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
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
<p>igt@kms_color@ctm-red-to-blue@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.18, 1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.20, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.19, 1.34] s</li>
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
<li>Exec time: [0.0, 0.32] s</li>
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
<li>Exec time: [0.0, 0.00] s</li>
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
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.06, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.32, 0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.35, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.41, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-128x128:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.33, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-128x42:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-256x256:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.33, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-256x85:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-32x10:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-32x32:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-512x170:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-512x512:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-64x21:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-a-64x64:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.53, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-128x128:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.33, 3.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-128x42:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-256x256:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.33, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-256x85:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-32x10:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-32x32:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-512x170:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-512x512:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-64x21:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-b-64x64:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.33, 3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-128x128:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.44, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-128x42:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.44, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-256x256:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.42, 3.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-256x85:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.43, 3.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-32x10:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-32x32:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-512x170:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-512x512:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-64x21:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.45, 3.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-c-64x64:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.45, 3.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.60, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen@pipe-d-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.61, 2.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-128x128:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.57, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-128x42:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-256x256:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.58, 3.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-256x85:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-32x10:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-32x32:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-512x170:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-512x512:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-64x21:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-a-64x64:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.62, 3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-128x128:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.58, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-128x42:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-256x256:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.58, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-256x85:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-32x10:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-32x32:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-512x170:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-512x512:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-64x21:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-b-64x64:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.58, 3.63] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-128x128:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.76, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-128x42:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.81, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-256x256:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.80, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-256x85:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.83, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-32x10:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-32x32:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-512x170:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-512x512:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-64x21:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.83, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen@pipe-c-64x64:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.82, 3.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-128x128:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.02, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-128x42:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-256x256:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.05, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-256x85:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-32x10:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-32x32:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-512x170:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-512x512:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-64x21:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-a-64x64:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [3.95, 5.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-128x128:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.01, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-128x42:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-256x256:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.00, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-256x85:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-32x10:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-32x32:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-512x170:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-512x512:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-64x21:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-64x64:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [4.01, 5.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-128x128:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.02, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-128x42:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.03, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-256x256:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.04, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-256x85:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.03, 5.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-32x10:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-32x32:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-512x170:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-512x512:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-64x21:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.02, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-64x64:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [4.02, 5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-128x42:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-256x85:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-32x10:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-32x32:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-512x170:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-512x512:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-64x21:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-d-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.05] s</li>
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
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-128x128:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.18, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-128x42:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-256x256:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.16, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-256x85:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-32x10:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-32x32:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-512x170:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-512x512:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-64x21:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-64x64:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.14, 1.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-128x128:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.17, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-128x42:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-256x256:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.17, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-256x85:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-32x10:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-32x32:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-512x170:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-512x512:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-64x21:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-64x64:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.18, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-128x128:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.18, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-128x42:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.16, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-256x256:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.16, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-256x85:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.16, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-32x10:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-32x32:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-512x170:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-512x512:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-64x21:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.18, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-c-64x64:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.16, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.16, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-d-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.18, 1.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-128x128:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.18, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-128x42:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-256x256:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.17, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-256x85:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.02, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-32x10:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-32x32:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-512x170:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-512x512:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-64x21:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-64x64:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.17, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-128x128:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.17, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-128x42:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-256x256:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.17, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-256x85:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-32x10:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-32x32:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-512x170:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-512x512:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-64x21:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.01, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-b-64x64:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.17, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-128x128:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.16, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-128x42:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.16, 5.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-256x256:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.16, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-256x85:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.16, 5.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-32x10:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-32x32:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-512x170:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-512x512:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-64x21:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.16, 5.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-64x64:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.17, 5.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-128x128:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-128x42:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-256x256:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-256x85:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-32x10:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-32x32:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-512x170:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-512x512:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-64x21:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.18, 3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-64x64:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-128x128:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.20, 4.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-256x256:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.20, 4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge@pipe-a-64x64:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.31, 4.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-128x128:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.63, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-256x256:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.63, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@right-edge@pipe-a-64x64:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.69, 4.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-128x128:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.21, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-256x256:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.19, 4.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-a-64x64:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [3.32, 4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-128x128:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.64, 4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-256x256:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.63, 4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-edge@pipe-a-64x64:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.69, 4.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-v=
arying-size:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [27.92, 37.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [28.25, 38.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [29.11, 42.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@legacy:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [27.96, 38.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@toggle:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [28.78, 41.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@varying-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [28.75, 41.75] s</li>
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
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.47, 0.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.47, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions-varying=
-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.47, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@legacy:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.47, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@toggle:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.46, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@varying-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.46, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [21.48, 21.51] s</li>
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
<li>Exec time: [21.48, 21.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.48, 21.50] s</li>
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
<li>Exec time: [21.48] s</li>
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
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.24, 2.44] s</li>
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
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.23, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.25, 1.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.26, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.27, 0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.30, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.29, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.30, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.25, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.25, 1.41] s</li>
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
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.68, 2.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [1.75, 4.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.87, 4.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.17, 3.71] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7076_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb8/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb7/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@feature_discovery@psr2.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-glk1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a>) +218 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327=
">i915#5327</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325=
">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl3/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1099">i915#1099</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@gem_exec_balancer@parallel-balance=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-gl=
k9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-glk1/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb8/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-=
kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb3/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109313">fdo#109313</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109313">fdo#109313</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-snb2/igt@gem_exec_flush@basic-wb-pro-default.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/s=
hard-snb6/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
+3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gem_exec_params@no-bsd.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#=
109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb7/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb8/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/48=
77">i915#4877</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2=
190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl8/igt@gem_lmem_swapping@parallel-multi.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-glk7/igt@gem_lmem_swapping@parallel-multi.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4613">i915#4613</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl3/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-glk5/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl7/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb4/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl3/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4270">i915#4270</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_pxp@verify-pxp-stale-ctx-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-=
tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +295 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb1/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-glk9/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl4/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-cycl=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3297">i915#3297</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycl=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3297">i915#3297</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@gen7_exec_parse@basic-offset.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@gen7_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@gen9_exec_parse@allowed-single.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
7">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2856">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
04">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11631/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl6/igt@i91=
5_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11631/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@i=
915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4281">i915#4281</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shar=
d-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lps=
p.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-non-lps=
p.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110892">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109506">fdo#109506</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@i915_pm_sseu@full-enable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i91=
5#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb8/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb1/igt@i915_query@test-query-geometry-subs=
lices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5723">i915#5723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
73">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@i915_selftest@live@hangcheck.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl4/igt@i915_suspend@fence-restore-untiled.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb5/igt@kms_big_fb@yf-tiled-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3689">i915#3689</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-glk7/igt@kms_ccs@pipe-a-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@kms_ccs@pipe-a-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_ccs@pipe-d-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-apl4/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-glk7/igt@kms_chamelium@hdmi-aspect-ratio.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_chamelium@hdmi-edid-read.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +23 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +15 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3299">i915#3299</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb3/igt@kms_content_protection@dp-mst-type=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_content_protection@mei_interfa=
ce.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109300">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111066">fdo#111066</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb3/igt@kms_content_protection@uevent.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063=
">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement@pipe-a-256x85} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-snb6/igt@kms_cursor_crc@cursor-rapid-movemen=
t@pipe-a-256x85.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +345 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_draw_crc@draw-method-xrgb21010=
10-pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb21010=
10-render-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_flip@2x-plain-flip-fb-recreate=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank@b-d=
p1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7076/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
614">i915#3614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-=
kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-=
ytile-upscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-64bpp-ytile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4911">i915#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +37 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7076/shard-apl4/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3536">i915#3536</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-non=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb6/igt@kms_plane_lowres@pipe-b-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-d-t=
iling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-d=
ownscale-with-modifier:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_plane_scaling@downscale-with-m=
odifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-d=
ownscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_plane_scaling@planes-downscale=
-factor-0-25@pipe-b-edp-1-planes-downscale.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-do=
wnscale:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb8/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1-planes-downscale.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-iclb2/igt@kms_plane_scaling@p=
lanes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2920">i915#2920</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl7/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-glk5/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard=
-iclb3/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-tglb7/igt@kms_setmode@invalid-clone-exclusive=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3555">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb7/igt@kms_setmode@invalid-clone-exclusive=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl8/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-kbl7/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-apl6/igt@kms_vblank@pipe-d-wait-forked-hang.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +258 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-glk2/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb6/igt@nouveau_crc@pipe-a-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-apl2/igt@perf@polling-parameterized.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl6=
/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5639">i915#5639</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import_to_different_fd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@prime_nv_api@nv_self_import_to_dif=
ferent_fd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109291">fdo#109291</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb7/igt@prime_nv_pcopy@test3_3.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb8/igt@prime_vgem@fence-write-hang.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295"=
>fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-apl8/igt@syncobj_timeline@invalid-transfer-n=
on-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5098">i915#5098</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-tglb7/igt@sysfs_clients@busy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-kbl1/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-apl4/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7076/shard-iclb5/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7076/shard-iclb8/igt@tools_test@sysfs_l3_parity.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">=
fdo#109307</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-apl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7076/shard-apl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PAS=
S</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/s=
hard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
076/shard-apl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-snb6/igt@gem_exec_flush@basic-uc-set-default.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7076/shard-snb5/igt@gem_exec_flush@basic-uc-set-default.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@system-suspend-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-snb7/igt@i915_suspend@system-suspend-without-i915.html"=
>DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7076/shard-snb4/igt@i915_suspend@system-suspend-without-i915.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-tglb2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-tglb2/igt@kms_big_fb@x-tiled-max=
-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4911">i915#4911</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7076/shard-glk9/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytileccs-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7076/shard-kbl6/igt@kms_plane@plane-panning-bott=
om-right-suspend@pipe-b-planes.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#1=
09642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11106=
8">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7076/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb7/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-icl=
b2/igt@kms_psr@psr2_basic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/561=
4">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7076/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#=
4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb7/igt@gem_exec_balancer@parallel-keep-in-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7076/shard-iclb2/igt@gem_exec_balancer@parallel-keep-in-fence.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
614">i915#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2848">i915=
#2848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7076/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-glk1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7076/shard-glk4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#18=
88</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11631/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109278">fdo#109278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7076/shard-iclb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-=
legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11631/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl2/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11631/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11631/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11631/shard-apl7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11631/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#525=
7</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_707=
6/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl8/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard=
-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7076/shard-apl6/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl4/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7076/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/shard-apl3/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6471 -&gt; IGTPW_7076</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11631: 410072c9a105aa0f2d37b8793ae5e5b43f6fa066 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7076: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7076/index.htm=
l<br />
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0643680205272454373==--
