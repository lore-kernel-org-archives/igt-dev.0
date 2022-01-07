Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2506533024454486265=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 07 Jan 2022 06:17:43 -0000
Message-ID: <164153626330.24390.9790419970357960628@emeril.freedesktop.org>
References: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIElH?=
 =?utf-8?q?T_support_for_plane_color_management_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2506533024454486265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add IGT support for plane color management (rev3)
URL   : https://patchwork.freedesktop.org/series/96895/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11053 -> IGTPW_6543
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6543 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6543, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/index.html

Participating hosts (43 -> 36)
------------------------------

  Additional (1): fi-pnv-d510 
  Missing    (8): fi-kbl-soraka bat-dg1-6 bat-dg1-5 bat-adlp-6 bat-adlp-4 bat-rpls-1 fi-bdw-samus bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6543:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@pipe-a-gamma:
    - fi-cfl-guc:         NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-guc/igt@kms_color@pipe-a-gamma.html
    - fi-ilk-650:         NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ilk-650/igt@kms_color@pipe-a-gamma.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-elk-e7500/igt@kms_color@pipe-a-gamma.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-dsi/igt@kms_color@pipe-a-gamma.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-7500u/igt@kms_color@pipe-a-gamma.html

  * {igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][6] +51 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-tgl-dsi/igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes.html

  * igt@kms_color@pipe-b-gamma:
    - fi-snb-2600:        NOTRUN -> [FAIL][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2600/igt@kms_color@pipe-b-gamma.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-x1275/igt@kms_color@pipe-b-gamma.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][9] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bwr-2160/igt@kms_color@pipe-b-gamma.html
    - fi-skl-guc:         NOTRUN -> [FAIL][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-guc/igt@kms_color@pipe-b-gamma.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@kms_color@pipe-b-gamma.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][12] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8700k/igt@kms_color@pipe-b-gamma.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bdw-5557u/igt@kms_color@pipe-b-gamma.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][14] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-j4005/igt@kms_color@pipe-b-gamma.html

  * {igt@kms_color@pipe-b-plane-ctm-0-50} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][15] +51 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-tgl-1115g4/igt@kms_color@pipe-b-plane-ctm-0-50.html

  * {igt@kms_color@pipe-b-plane-ctm-red-to-blue} (NEW):
    - fi-rkl-guc:         NOTRUN -> [SKIP][16] +51 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-b-plane-ctm-red-to-blue.html

  * igt@kms_color@pipe-c-gamma:
    - fi-ivb-3770:        NOTRUN -> [FAIL][17] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ivb-3770/igt@kms_color@pipe-c-gamma.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][18] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-hsw-4770/igt@kms_color@pipe-c-gamma.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][19] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bxt-dsi/igt@kms_color@pipe-c-gamma.html
    - fi-cml-u2:          NOTRUN -> [FAIL][20] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cml-u2/igt@kms_color@pipe-c-gamma.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][21] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8109u/igt@kms_color@pipe-c-gamma.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][22] +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@kms_color@pipe-c-gamma.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][23] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6700k2/igt@kms_color@pipe-c-gamma.html

  * {igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][24] +51 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-jsl-1/igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes.html

  * {igt@kms_color@pipe-d-plane-ctm-blue-to-red} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][25] +51 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-d-plane-ctm-blue-to-red.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11053 and IGTPW_6543:

### New IGT tests (52) ###

  * igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-invalid-plane-gamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-0-25:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-0-50:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-0-75:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-blue-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-plane-ctm-green-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-max:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-plane-ctm-negative:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-red-to-blue:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-degamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-gamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-b-invalid-plane-ctm-matrix-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-invalid-plane-gamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-ctm-0-25:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-ctm-0-50:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-ctm-0-75:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-ctm-blue-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-ctm-green-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-ctm-max:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-ctm-negative:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-b-plane-ctm-red-to-blue:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-degamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-gamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-0-25:
    - Statuses : 33 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-plane-ctm-0-50:
    - Statuses : 33 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_color@pipe-c-plane-ctm-0-75:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-blue-to-red:
    - Statuses : 33 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-plane-ctm-green-to-red:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-max:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-negative:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-red-to-blue:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-degamma:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-gamma:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-invalid-plane-ctm-matrix-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-invalid-plane-gamma-lut-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-0-25:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-0-50:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-0-75:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-blue-to-red:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-green-to-red:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-max:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-negative:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-red-to-blue:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-degamma:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-gamma:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6543 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@mman:
    - fi-snb-2520m:       [PASS][26] -> [DMESG-FAIL][27] ([i915#4610])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-snb-2520m/igt@i915_selftest@live@mman.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@i915_selftest@live@mman.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-bdw-5557u:       NOTRUN -> [SKIP][28] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-a-ctm-max:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][29] ([fdo#109271]) +102 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-7567u/igt@kms_color@pipe-a-ctm-max.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][30] ([fdo#109271]) +49 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-guc/igt@kms_color@pipe-a-ctm-max.html

  * {igt@kms_color@pipe-a-plane-ctm-blue-to-red} (NEW):
    - fi-kbl-7500u:       NOTRUN -> [SKIP][31] ([fdo#109271]) +66 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-7500u/igt@kms_color@pipe-a-plane-ctm-blue-to-red.html

  * {igt@kms_color@pipe-a-plane-ctm-green-to-red} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][32] ([fdo#109271]) +102 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-nick/igt@kms_color@pipe-a-plane-ctm-green-to-red.html

  * {igt@kms_color@pipe-a-plane-ctm-negative} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][33] ([fdo#109271]) +103 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-blb-e6850/igt@kms_color@pipe-a-plane-ctm-negative.html

  * {igt@kms_color@pipe-a-plane-ctm-red-to-blue} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][34] ([fdo#109271]) +103 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bwr-2160/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][35] ([fdo#109278]) +51 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ehl-2/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html

  * {igt@kms_color@pipe-a-plane-degamma} (NEW):
    - fi-skl-6700k2:      NOTRUN -> [SKIP][36] ([fdo#109271]) +66 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6700k2/igt@kms_color@pipe-a-plane-degamma.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][37] ([fdo#109271]) +91 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-n3050/igt@kms_color@pipe-a-plane-degamma.html

  * igt@kms_color@pipe-b-ctm-0-75:
    - fi-bsw-kefka:       NOTRUN -> [DMESG-WARN][38] ([i915#89]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-kefka/igt@kms_color@pipe-b-ctm-0-75.html

  * igt@kms_color@pipe-b-ctm-negative:
    - fi-ilk-650:         NOTRUN -> [SKIP][39] ([fdo#109271]) +103 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ilk-650/igt@kms_color@pipe-b-ctm-negative.html

  * igt@kms_color@pipe-b-degamma:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][40] ([i915#71]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-kefka/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-b-gamma:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][41] ([i915#1149]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-tgl-1115g4/igt@kms_color@pipe-b-gamma.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][42] ([i915#1149]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-b-gamma.html

  * {igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes} (NEW):
    - fi-bdw-5557u:       NOTRUN -> [SKIP][43] ([fdo#109271]) +98 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bdw-5557u/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html
    - fi-skl-guc:         NOTRUN -> [SKIP][44] ([fdo#109271]) +66 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-guc/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html

  * igt@kms_color@pipe-c-degamma:
    - fi-snb-2600:        NOTRUN -> [SKIP][45] ([fdo#109271]) +103 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2600/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color@pipe-c-gamma:
    - fi-rkl-11600:       NOTRUN -> [FAIL][46] ([i915#1149]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-c-gamma.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][47] ([i915#71]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-n3050/igt@kms_color@pipe-c-gamma.html

  * {igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][48] ([fdo#109271]) +103 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes.html

  * {igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][49] ([fdo#109271]) +51 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-hsw-4770/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][50] ([fdo#109271]) +66 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bxt-dsi/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html

  * {igt@kms_color@pipe-c-plane-ctm-negative} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][51] ([fdo#109271]) +66 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8109u/igt@kms_color@pipe-c-plane-ctm-negative.html

  * {igt@kms_color@pipe-c-plane-ctm-red-to-blue} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][52] ([fdo#109278]) +66 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cml-u2/igt@kms_color@pipe-c-plane-ctm-red-to-blue.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - fi-rkl-11600:       NOTRUN -> [SKIP][53] ([i915#1149] / [i915#533]) +9 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][54] ([fdo#109271]) +66 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8700k/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-max:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][55] ([fdo#109271]) +102 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-8809g/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color@pipe-d-ctm-negative:
    - fi-rkl-guc:         NOTRUN -> [SKIP][56] ([i915#1149] / [i915#533]) +9 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color@pipe-d-ctm-red-to-blue:
    - fi-pnv-d510:        NOTRUN -> [SKIP][57] ([fdo#109271]) +161 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-pnv-d510/igt@kms_color@pipe-d-ctm-red-to-blue.html

  * igt@kms_color@pipe-d-gamma:
    - fi-glk-dsi:         NOTRUN -> [SKIP][58] ([fdo#109271]) +66 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-dsi/igt@kms_color@pipe-d-gamma.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][59] ([fdo#109271]) +66 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ivb-3770/igt@kms_color@pipe-d-gamma.html

  * igt@kms_color@pipe-d-invalid-ctm-matrix-sizes:
    - fi-glk-j4005:       NOTRUN -> [SKIP][60] ([fdo#109271]) +66 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-j4005/igt@kms_color@pipe-d-invalid-ctm-matrix-sizes.html

  * igt@kms_color@pipe-d-invalid-degamma-lut-sizes:
    - fi-hsw-4770:        NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#533]) +14 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-hsw-4770/igt@kms_color@pipe-d-invalid-degamma-lut-sizes.html

  * igt@kms_color@pipe-d-invalid-gamma-lut-sizes:
    - fi-rkl-guc:         NOTRUN -> [SKIP][62] ([i915#533]) +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][63] ([i915#533]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html

  * igt@kms_color@pipe-d-legacy-gamma:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][64] ([fdo#109271]) +66 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-x1275/igt@kms_color@pipe-d-legacy-gamma.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][65] ([fdo#109271]) +66 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@kms_color@pipe-d-legacy-gamma.html

  * {igt@kms_color@pipe-d-plane-ctm-0-75} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][66] ([fdo#109271]) +103 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-elk-e7500/igt@kms_color@pipe-d-plane-ctm-0-75.html

  * {igt@kms_color@pipe-d-plane-ctm-green-to-red} (NEW):
    - fi-bsw-kefka:       NOTRUN -> [SKIP][67] ([fdo#109271]) +80 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-kefka/igt@kms_color@pipe-d-plane-ctm-green-to-red.html

  * {igt@kms_color@pipe-d-plane-gamma} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][68] ([fdo#109271]) +66 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-guc/igt@kms_color@pipe-d-plane-gamma.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][69] -> [INCOMPLETE][70] ([i915#4547] / [i915#4838])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-snb-2520m:       NOTRUN -> [FAIL][71] ([i915#2426] / [i915#4312])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@runner@aborted.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][72] ([i915#2722] / [i915#4312])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bxt-dsi:         [DMESG-FAIL][73] ([i915#541]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [DMESG-WARN][75] ([i915#4269]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4610]: https://gitlab.freedesktop.org/drm/intel/issues/4610
  [i915#4838]: https://gitlab.freedesktop.org/drm/intel/issues/4838
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#89]: https://gitlab.freedesktop.org/drm/intel/issues/89


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6325 -> IGTPW_6543

  CI-20190529: 20190529
  CI_DRM_11053: f0ad19ec6238528d9ea1ee54c9dcde4e0119f1e5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6543: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/index.html
  IGT_6325: ac29e097d4ff0f2e269a955ca86c5eb23908467a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+++ 138 lines
--- 0 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/index.html

--===============2506533024454486265==
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
<tr><td><b>Series:</b></td><td>Add IGT support for plane color management (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96895/">https://patchwork.freedesktop.org/series/96895/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11053 -&gt; IGTPW_6543</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6543 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6543, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/index.html</p>
<h2>Participating hosts (43 -&gt; 36)</h2>
<p>Additional (1): fi-pnv-d510 <br />
  Missing    (8): fi-kbl-soraka bat-dg1-6 bat-dg1-5 bat-adlp-6 bat-adlp-4 bat-rpls-1 fi-bdw-samus bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6543:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-guc/igt@kms_color@pipe-a-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ilk-650/igt@kms_color@pipe-a-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-elk-e7500/igt@kms_color@pipe-a-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-dsi/igt@kms_color@pipe-a-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-7500u/igt@kms_color@pipe-a-gamma.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-tgl-dsi/igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2600/igt@kms_color@pipe-b-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-x1275/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bwr-2160/igt@kms_color@pipe-b-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-guc/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@kms_color@pipe-b-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8700k/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bdw-5557u/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-j4005/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-plane-ctm-0-50} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-tgl-1115g4/igt@kms_color@pipe-b-plane-ctm-0-50.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-b-plane-ctm-red-to-blue.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ivb-3770/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-hsw-4770/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bxt-dsi/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cml-u2/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8109u/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6700k2/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes} (NEW):</p>
<ul>
<li>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-jsl-1/igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-blue-to-red} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-d-plane-ctm-blue-to-red.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11053 and IGTPW_6543:</p>
<h3>New IGT tests (52)</h3>
<ul>
<li>
<p>igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-invalid-plane-gamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-0-25:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-0-50:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-0-75:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-blue-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-green-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-max:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-negative:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-red-to-blue:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-degamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-gamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-invalid-plane-ctm-matrix-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-invalid-plane-gamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-0-25:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-0-50:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-0-75:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-blue-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-green-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-max:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-negative:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-red-to-blue:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-degamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-gamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-0-25:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-0-50:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-0-75:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-blue-to-red:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-green-to-red:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-max:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-negative:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-red-to-blue:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-degamma:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-gamma:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-plane-ctm-matrix-sizes:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-plane-gamma-lut-sizes:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-0-25:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-0-50:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-0-75:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-blue-to-red:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-green-to-red:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-max:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-negative:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-red-to-blue:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-degamma:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-gamma:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6543 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-snb-2520m/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@i915_selftest@live@mman.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4610">i915#4610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bdw-5557u/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-7567u/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-guc/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +49 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-blue-to-red} (NEW):</p>
<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-7500u/igt@kms_color@pipe-a-plane-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-green-to-red} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-nick/igt@kms_color@pipe-a-plane-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-negative} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-blb-e6850/igt@kms_color@pipe-a-plane-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bwr-2160/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ehl-2/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +51 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-degamma} (NEW):</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6700k2/igt@kms_color@pipe-a-plane-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-n3050/igt@kms_color@pipe-a-plane-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +91 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-75:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-kefka/igt@kms_color@pipe-b-ctm-0-75.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/89">i915#89</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-negative:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ilk-650/igt@kms_color@pipe-b-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-kefka/igt@kms_color@pipe-b-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-tgl-1115g4/igt@kms_color@pipe-b-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +3 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-b-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bdw-5557u/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +98 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-guc/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2600/igt@kms_color@pipe-c-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-c-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-n3050/igt@kms_color@pipe-c-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-hsw-4770/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +51 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bxt-dsi/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-negative} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8109u/igt@kms_color@pipe-c-plane-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cml-u2/igt@kms_color@pipe-c-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-8700k/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-8809g/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-pnv-d510/igt@kms_color@pipe-d-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +161 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-gamma:</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-dsi/igt@kms_color@pipe-d-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-ivb-3770/igt@kms_color@pipe-d-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-ctm-matrix-sizes:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-glk-j4005/igt@kms_color@pipe-d-invalid-ctm-matrix-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-degamma-lut-sizes:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-hsw-4770/igt@kms_color@pipe-d-invalid-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-gamma-lut-sizes:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-guc/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +4 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-rkl-11600/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-legacy-gamma:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-kbl-x1275/igt@kms_color@pipe-d-legacy-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@kms_color@pipe-d-legacy-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-0-75} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-elk-e7500/igt@kms_color@pipe-d-plane-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-green-to-red} (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bsw-kefka/igt@kms_color@pipe-d-plane-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +80 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-gamma} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cfl-guc/igt@kms_color@pipe-d-plane-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4838">i915#4838</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-snb-2520m/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11053/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6325 -&gt; IGTPW_6543</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11053: f0ad19ec6238528d9ea1ee54c9dcde4e0119f1e5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6543: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6543/index.html<br />
  IGT_6325: ac29e097d4ff0f2e269a955ca86c5eb23908467a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+++ 138 lines<br />
--- 0 lines</p>

</body>
</html>

--===============2506533024454486265==--
