Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1848528837298640310=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Jan 2022 10:46:31 -0000
Message-ID: <164129319191.30367.1989369981939167003@emeril.freedesktop.org>
References: <20220104080235.1715444-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220104080235.1715444-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIElH?=
 =?utf-8?q?T_support_for_plane_color_management_=28rev2=29?=
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

--===============1848528837298640310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add IGT support for plane color management (rev2)
URL   : https://patchwork.freedesktop.org/series/96895/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11044 -> IGTPW_6534
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6534 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6534, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/index.html

Participating hosts (46 -> 36)
------------------------------

  Missing    (10): bat-dg1-6 bat-dg1-5 fi-tgl-u2 fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6534:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-kbl-soraka/igt@i915_selftest@live@gem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-soraka/igt@i915_selftest@live@gem.html

  * igt@kms_color@pipe-a-gamma:
    - fi-cfl-guc:         NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-guc/igt@kms_color@pipe-a-gamma.html
    - fi-ilk-650:         NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ilk-650/igt@kms_color@pipe-a-gamma.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-elk-e7500/igt@kms_color@pipe-a-gamma.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-glk-dsi/igt@kms_color@pipe-a-gamma.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-7500u/igt@kms_color@pipe-a-gamma.html

  * {igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][8] +51 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-dsi/igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes.html

  * igt@kms_color@pipe-b-gamma:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-soraka/igt@kms_color@pipe-b-gamma.html
    - fi-snb-2600:        NOTRUN -> [FAIL][10] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2600/igt@kms_color@pipe-b-gamma.html
    - fi-kbl-x1275:       NOTRUN -> [FAIL][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-x1275/igt@kms_color@pipe-b-gamma.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][12] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bwr-2160/igt@kms_color@pipe-b-gamma.html
    - fi-skl-guc:         NOTRUN -> [FAIL][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-guc/igt@kms_color@pipe-b-gamma.html
    - fi-snb-2520m:       NOTRUN -> [FAIL][14] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2520m/igt@kms_color@pipe-b-gamma.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8700k/igt@kms_color@pipe-b-gamma.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bdw-5557u/igt@kms_color@pipe-b-gamma.html

  * {igt@kms_color@pipe-b-plane-ctm-0-50} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][17] +51 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-1115g4/igt@kms_color@pipe-b-plane-ctm-0-50.html

  * {igt@kms_color@pipe-b-plane-ctm-red-to-blue} (NEW):
    - fi-rkl-guc:         NOTRUN -> [SKIP][18] +51 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-b-plane-ctm-red-to-blue.html

  * igt@kms_color@pipe-c-gamma:
    - fi-ivb-3770:        NOTRUN -> [FAIL][19] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ivb-3770/igt@kms_color@pipe-c-gamma.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][20] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-hsw-4770/igt@kms_color@pipe-c-gamma.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][21] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bxt-dsi/igt@kms_color@pipe-c-gamma.html
    - fi-cml-u2:          NOTRUN -> [FAIL][22] +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cml-u2/igt@kms_color@pipe-c-gamma.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][23] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8109u/igt@kms_color@pipe-c-gamma.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][24] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6600u/igt@kms_color@pipe-c-gamma.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][25] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6700k2/igt@kms_color@pipe-c-gamma.html

  * {igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][26] +51 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-jsl-1/igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes.html

  * {igt@kms_color@pipe-d-plane-ctm-blue-to-red} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][27] +51 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-d-plane-ctm-blue-to-red.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@client:
    - {fi-tgl-dsi}:       [PASS][28] -> [INCOMPLETE][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-tgl-dsi/igt@i915_selftest@live@client.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-dsi/igt@i915_selftest@live@client.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11044 and IGTPW_6534:

### New IGT tests (52) ###

  * igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-invalid-plane-gamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-plane-ctm-0-25:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-plane-ctm-0-50:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-0-75:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-plane-ctm-blue-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

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
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-plane-degamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-plane-gamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-invalid-plane-ctm-matrix-sizes:
    - Statuses : 33 skip(s)
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
    - Exec time: [0.0, 0.00] s

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
    - Exec time: [0.0] s

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
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-0-25:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-0-50:
    - Statuses : 33 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@kms_color@pipe-c-plane-ctm-0-75:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-blue-to-red:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-green-to-red:
    - Statuses : 33 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-max:
    - Statuses : 33 skip(s)
    - Exec time: [0.0, 0.01] s

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

  Here are the changes found in IGTPW_6534 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_lrc:
    - fi-bsw-n3050:       [PASS][30] -> [DMESG-FAIL][31] ([i915#2373])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [PASS][32] -> [INCOMPLETE][33] ([i915#3921])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * igt@kms_color@pipe-a-ctm-max:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +102 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-7567u/igt@kms_color@pipe-a-ctm-max.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][35] ([fdo#109271]) +48 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-guc/igt@kms_color@pipe-a-ctm-max.html

  * {igt@kms_color@pipe-a-plane-ctm-blue-to-red} (NEW):
    - fi-kbl-7500u:       NOTRUN -> [SKIP][36] ([fdo#109271]) +66 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-7500u/igt@kms_color@pipe-a-plane-ctm-blue-to-red.html

  * {igt@kms_color@pipe-a-plane-ctm-green-to-red} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][37] ([fdo#109271]) +120 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-nick/igt@kms_color@pipe-a-plane-ctm-green-to-red.html

  * {igt@kms_color@pipe-a-plane-ctm-negative} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][38] ([fdo#109271]) +103 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-blb-e6850/igt@kms_color@pipe-a-plane-ctm-negative.html

  * {igt@kms_color@pipe-a-plane-ctm-red-to-blue} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][39] ([fdo#109271]) +103 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bwr-2160/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][40] ([fdo#109278]) +51 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ehl-2/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html

  * {igt@kms_color@pipe-a-plane-degamma} (NEW):
    - fi-skl-6700k2:      NOTRUN -> [SKIP][41] ([fdo#109271]) +66 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6700k2/igt@kms_color@pipe-a-plane-degamma.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][42] ([fdo#109271]) +91 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-n3050/igt@kms_color@pipe-a-plane-degamma.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - fi-bsw-kefka:       NOTRUN -> [DMESG-WARN][43] ([i915#89])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-kefka/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-ctm-negative:
    - fi-ilk-650:         NOTRUN -> [SKIP][44] ([fdo#109271]) +103 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ilk-650/igt@kms_color@pipe-b-ctm-negative.html

  * igt@kms_color@pipe-b-degamma:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][45] ([i915#71]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-kefka/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-b-gamma:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][46] ([i915#1149]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-1115g4/igt@kms_color@pipe-b-gamma.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][47] ([i915#1149]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-b-gamma.html

  * {igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes} (NEW):
    - fi-bdw-5557u:       NOTRUN -> [SKIP][48] ([fdo#109271]) +66 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bdw-5557u/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html
    - fi-skl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271]) +66 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-guc/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html

  * igt@kms_color@pipe-c-degamma:
    - fi-snb-2600:        NOTRUN -> [SKIP][50] ([fdo#109271]) +103 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2600/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color@pipe-c-gamma:
    - fi-rkl-11600:       NOTRUN -> [FAIL][51] ([i915#1149]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-c-gamma.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][52] ([i915#71]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-n3050/igt@kms_color@pipe-c-gamma.html

  * {igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][53] ([fdo#109271]) +103 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2520m/igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes.html

  * {igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][54] ([fdo#109271]) +51 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-hsw-4770/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][55] ([fdo#109271]) +66 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bxt-dsi/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html

  * {igt@kms_color@pipe-c-plane-ctm-0-75} (NEW):
    - fi-kbl-soraka:      NOTRUN -> [SKIP][56] ([fdo#109271]) +66 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-soraka/igt@kms_color@pipe-c-plane-ctm-0-75.html

  * {igt@kms_color@pipe-c-plane-ctm-negative} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][57] ([fdo#109271]) +66 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8109u/igt@kms_color@pipe-c-plane-ctm-negative.html

  * {igt@kms_color@pipe-c-plane-ctm-red-to-blue} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][58] ([fdo#109278]) +66 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cml-u2/igt@kms_color@pipe-c-plane-ctm-red-to-blue.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - fi-rkl-11600:       NOTRUN -> [SKIP][59] ([i915#1149] / [i915#533]) +9 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][60] ([fdo#109271]) +66 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8700k/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-max:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][61] ([fdo#109271]) +102 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-8809g/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color@pipe-d-ctm-negative:
    - fi-rkl-guc:         NOTRUN -> [SKIP][62] ([i915#1149] / [i915#533]) +9 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color@pipe-d-ctm-red-to-blue:
    - fi-pnv-d510:        NOTRUN -> [SKIP][63] ([fdo#109271]) +103 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-pnv-d510/igt@kms_color@pipe-d-ctm-red-to-blue.html

  * igt@kms_color@pipe-d-gamma:
    - fi-glk-dsi:         NOTRUN -> [SKIP][64] ([fdo#109271]) +66 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-glk-dsi/igt@kms_color@pipe-d-gamma.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][65] ([fdo#109271]) +66 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ivb-3770/igt@kms_color@pipe-d-gamma.html

  * igt@kms_color@pipe-d-invalid-degamma-lut-sizes:
    - fi-hsw-4770:        NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#533]) +14 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-hsw-4770/igt@kms_color@pipe-d-invalid-degamma-lut-sizes.html

  * igt@kms_color@pipe-d-invalid-gamma-lut-sizes:
    - fi-rkl-guc:         NOTRUN -> [SKIP][67] ([i915#533]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][68] ([i915#533]) +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html

  * igt@kms_color@pipe-d-legacy-gamma:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][69] ([fdo#109271]) +66 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-x1275/igt@kms_color@pipe-d-legacy-gamma.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][70] ([fdo#109271]) +85 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6600u/igt@kms_color@pipe-d-legacy-gamma.html

  * {igt@kms_color@pipe-d-plane-ctm-0-75} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][71] ([fdo#109271]) +103 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-elk-e7500/igt@kms_color@pipe-d-plane-ctm-0-75.html

  * {igt@kms_color@pipe-d-plane-ctm-green-to-red} (NEW):
    - fi-bsw-kefka:       NOTRUN -> [SKIP][72] ([fdo#109271]) +80 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-kefka/igt@kms_color@pipe-d-plane-ctm-green-to-red.html

  * {igt@kms_color@pipe-d-plane-gamma} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][73] ([fdo#109271]) +66 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-guc/igt@kms_color@pipe-d-plane-gamma.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@uncore:
    - fi-bsw-nick:        [INCOMPLETE][74] -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-bsw-nick/igt@i915_selftest@live@uncore.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-nick/igt@i915_selftest@live@uncore.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [INCOMPLETE][76] ([i915#4547] / [i915#4838]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4838]: https://gitlab.freedesktop.org/drm/intel/issues/4838
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#89]: https://gitlab.freedesktop.org/drm/intel/issues/89


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6322 -> IGTPW_6534

  CI-20190529: 20190529
  CI_DRM_11044: 7b527a181f96f90a4c2f04d2705bdaffdd8168b6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6534: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/index.html
  IGT_6322: b0b7679b358b300b7b6bf42c6921d0aa1fc14388 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+++ 138 lines
--- 0 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/index.html

--===============1848528837298640310==
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
<tr><td><b>Series:</b></td><td>Add IGT support for plane color management (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96895/">https://patchwork.freedesktop.org/series/96895/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11044 -&gt; IGTPW_6534</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6534 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6534, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/index.html</p>
<h2>Participating hosts (46 -&gt; 36)</h2>
<p>Missing    (10): bat-dg1-6 bat-dg1-5 fi-tgl-u2 fi-icl-u2 fi-bsw-cyan bat-adlp-6 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6534:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-kbl-soraka/igt@i915_selftest@live@gem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-soraka/igt@i915_selftest@live@gem.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-guc/igt@kms_color@pipe-a-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ilk-650/igt@kms_color@pipe-a-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-elk-e7500/igt@kms_color@pipe-a-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-glk-dsi/igt@kms_color@pipe-a-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-7500u/igt@kms_color@pipe-a-gamma.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-dsi/igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-soraka/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2600/igt@kms_color@pipe-b-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-x1275/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bwr-2160/igt@kms_color@pipe-b-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-guc/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2520m/igt@kms_color@pipe-b-gamma.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8700k/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bdw-5557u/igt@kms_color@pipe-b-gamma.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-plane-ctm-0-50} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-1115g4/igt@kms_color@pipe-b-plane-ctm-0-50.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-b-plane-ctm-red-to-blue.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ivb-3770/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-hsw-4770/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bxt-dsi/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cml-u2/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8109u/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6600u/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6700k2/igt@kms_color@pipe-c-gamma.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes} (NEW):</p>
<ul>
<li>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-jsl-1/igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-blue-to-red} (NEW):</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-d-plane-ctm-blue-to-red.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@client:<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-tgl-dsi/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-dsi/igt@i915_selftest@live@client.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11044 and IGTPW_6534:</p>
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
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-0-25:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
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
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-ctm-blue-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-degamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-gamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-invalid-plane-ctm-matrix-sizes:</p>
<ul>
<li>Statuses : 33 skip(s)</li>
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
<li>Exec time: [0.0, 0.00] s</li>
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
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.0, 0.01] s</li>
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
<p>Here are the changes found in IGTPW_6534 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-n3050/igt@i915_selftest@live@gt_lrc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2373">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-7567u/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-guc/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +48 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-blue-to-red} (NEW):</p>
<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-7500u/igt@kms_color@pipe-a-plane-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-green-to-red} (NEW):</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-nick/igt@kms_color@pipe-a-plane-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +120 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-negative} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-blb-e6850/igt@kms_color@pipe-a-plane-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bwr-2160/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ehl-2/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +51 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-degamma} (NEW):</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6700k2/igt@kms_color@pipe-a-plane-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-n3050/igt@kms_color@pipe-a-plane-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +91 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-kefka/igt@kms_color@pipe-b-ctm-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/89">i915#89</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-negative:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ilk-650/igt@kms_color@pipe-b-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-kefka/igt@kms_color@pipe-b-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-tgl-1115g4/igt@kms_color@pipe-b-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +3 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-b-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bdw-5557u/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-guc/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2600/igt@kms_color@pipe-c-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-gamma:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-c-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-n3050/igt@kms_color@pipe-c-gamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/71">i915#71</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-snb-2520m/igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-hsw-4770/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +51 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bxt-dsi/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-0-75} (NEW):</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-soraka/igt@kms_color@pipe-c-plane-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-negative} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8109u/igt@kms_color@pipe-c-plane-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cml-u2/igt@kms_color@pipe-c-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-8700k/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-8809g/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-pnv-d510/igt@kms_color@pipe-d-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-gamma:</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-glk-dsi/igt@kms_color@pipe-d-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-ivb-3770/igt@kms_color@pipe-d-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-degamma-lut-sizes:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-hsw-4770/igt@kms_color@pipe-d-invalid-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-gamma-lut-sizes:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-guc/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +4 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-rkl-11600/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-legacy-gamma:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-kbl-x1275/igt@kms_color@pipe-d-legacy-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6600u/igt@kms_color@pipe-d-legacy-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +85 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-0-75} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-elk-e7500/igt@kms_color@pipe-d-plane-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-green-to-red} (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-kefka/igt@kms_color@pipe-d-plane-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +80 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-gamma} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-cfl-guc/igt@kms_color@pipe-d-plane-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@uncore:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-bsw-nick/igt@i915_selftest@live@uncore.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-bsw-nick/igt@i915_selftest@live@uncore.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11044/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4838">i915#4838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6322 -&gt; IGTPW_6534</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11044: 7b527a181f96f90a4c2f04d2705bdaffdd8168b6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6534: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6534/index.html<br />
  IGT_6322: b0b7679b358b300b7b6bf42c6921d0aa1fc14388 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+++ 138 lines<br />
--- 0 lines</p>

</body>
</html>

--===============1848528837298640310==--
