Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5840416303682568918=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 06 May 2022 06:41:00 -0000
Message-ID: <165181926018.18815.7233881096642206642@emeril.freedesktop.org>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIElH?=
 =?utf-8?q?T_support_for_plane_color_management_=28rev5=29?=
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

--===============5840416303682568918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add IGT support for plane color management (rev5)
URL   : https://patchwork.freedesktop.org/series/96895/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11614 -> IGTPW_7048
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/index.html

Participating hosts (41 -> 36)
------------------------------

  Missing    (5): fi-kbl-soraka fi-bsw-cyan fi-icl-u2 bat-adlp-4 bat-jsl-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7048:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [SKIP][1] +51 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-adl-ddr5/igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes.html

  * {igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][2] +51 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-tgl-dsi/igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes.html

  * {igt@kms_color@pipe-a-plane-gamma} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][3] +51 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@kms_color@pipe-a-plane-gamma.html

  * {igt@kms_color@pipe-b-invalid-plane-gamma-lut-sizes} (NEW):
    - {bat-adln-1}:       NOTRUN -> [SKIP][4] +51 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-adln-1/igt@kms_color@pipe-b-invalid-plane-gamma-lut-sizes.html

  * {igt@kms_color@pipe-b-plane-ctm-0-50} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5] +51 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-tgl-1115g4/igt@kms_color@pipe-b-plane-ctm-0-50.html

  * {igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][6] +51 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-jsl-1/igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes.html

  * {igt@kms_color@pipe-c-plane-ctm-red-to-blue} (NEW):
    - {bat-rpls-1}:       NOTRUN -> [SKIP][7] +51 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-1/igt@kms_color@pipe-c-plane-ctm-red-to-blue.html

  * {igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [SKIP][8] +51 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-adlp-6/igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {bat-rpls-2}:       NOTRUN -> [WARN][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@i915_pm_rpm@module-reload.html

  * igt@kms_color@pipe-d-ctm-negative:
    - {bat-adln-1}:       NOTRUN -> [SKIP][10] +14 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-adln-1/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:
    - {bat-rpls-1}:       [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11614 and IGTPW_7048:

### New IGT tests (52) ###

  * igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

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
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-negative:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-ctm-red-to-blue:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-degamma:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-a-plane-gamma:
    - Statuses : 35 skip(s)
    - Exec time: [0.0] s

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
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-b-plane-ctm-red-to-blue:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-b-plane-degamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-b-plane-gamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-0-25:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-0-50:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-plane-ctm-0-75:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-blue-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-green-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-plane-ctm-max:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-plane-ctm-negative:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-ctm-red-to-blue:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-plane-degamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-c-plane-gamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-invalid-plane-ctm-matrix-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-invalid-plane-gamma-lut-sizes:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-0-25:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-0-50:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-0-75:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-blue-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-green-to-red:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-max:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-negative:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-ctm-red-to-blue:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-degamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-plane-gamma:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7048 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][13] -> [INCOMPLETE][14] ([i915#4785])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-bdw-5557u:       [PASS][15] -> [INCOMPLETE][16] ([i915#5692])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bdw-5557u/igt@i915_selftest@live@requests.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][17] ([fdo#109271] / [fdo#111827])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-snb-2600:        NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_color@pipe-a-ctm-max:
    - fi-kbl-7567u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +102 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-7567u/igt@kms_color@pipe-a-ctm-max.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][20] ([fdo#109271]) +14 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-guc/igt@kms_color@pipe-a-ctm-max.html

  * {igt@kms_color@pipe-a-plane-ctm-blue-to-red} (NEW):
    - fi-kbl-7500u:       NOTRUN -> [SKIP][21] ([fdo#109271]) +66 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-7500u/igt@kms_color@pipe-a-plane-ctm-blue-to-red.html

  * {igt@kms_color@pipe-a-plane-ctm-negative} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][22] ([fdo#109271]) +103 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-blb-e6850/igt@kms_color@pipe-a-plane-ctm-negative.html

  * {igt@kms_color@pipe-a-plane-ctm-red-to-blue} (NEW):
    - fi-bwr-2160:        NOTRUN -> [SKIP][23] ([fdo#109271]) +103 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bwr-2160/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][24] ([fdo#109278]) +51 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ehl-2/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html

  * {igt@kms_color@pipe-a-plane-degamma} (NEW):
    - fi-skl-6700k2:      NOTRUN -> [SKIP][25] ([fdo#109271]) +66 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-skl-6700k2/igt@kms_color@pipe-a-plane-degamma.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][26] ([fdo#109271]) +92 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-n3050/igt@kms_color@pipe-a-plane-degamma.html

  * igt@kms_color@pipe-b-ctm-negative:
    - fi-ilk-650:         NOTRUN -> [SKIP][27] ([fdo#109271]) +103 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ilk-650/igt@kms_color@pipe-b-ctm-negative.html

  * {igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes} (NEW):
    - fi-bdw-5557u:       NOTRUN -> [SKIP][28] ([fdo#109271]) +66 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bdw-5557u/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html
    - fi-skl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271]) +66 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-skl-guc/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][30] ([fdo#109271]) +51 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-g3258/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html

  * {igt@kms_color@pipe-b-plane-ctm-red-to-blue} (NEW):
    - fi-rkl-guc:         NOTRUN -> [SKIP][31] ([i915#4070]) +51 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-rkl-guc/igt@kms_color@pipe-b-plane-ctm-red-to-blue.html

  * igt@kms_color@pipe-c-degamma:
    - fi-snb-2600:        NOTRUN -> [SKIP][32] ([fdo#109271]) +103 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2600/igt@kms_color@pipe-c-degamma.html

  * {igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][33] ([fdo#109271]) +103 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2520m/igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes.html

  * {igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes} (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][34] ([fdo#109271]) +51 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][35] ([fdo#109271]) +66 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bxt-dsi/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html

  * {igt@kms_color@pipe-c-plane-ctm-max} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][36] ([fdo#109271]) +102 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bdw-gvtdvm/igt@kms_color@pipe-c-plane-ctm-max.html

  * {igt@kms_color@pipe-c-plane-ctm-negative} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [SKIP][37] ([fdo#109271]) +66 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-cfl-8109u/igt@kms_color@pipe-c-plane-ctm-negative.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][38] ([fdo#109271]) +66 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-cfl-8700k/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-max:
    - fi-hsw-g3258:       NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#533]) +14 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-g3258/igt@kms_color@pipe-d-ctm-max.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][40] ([fdo#109271]) +102 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-8809g/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color@pipe-d-ctm-negative:
    - fi-rkl-guc:         NOTRUN -> [SKIP][41] ([i915#1149] / [i915#4070] / [i915#533]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-rkl-guc/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color@pipe-d-ctm-red-to-blue:
    - fi-pnv-d510:        NOTRUN -> [SKIP][42] ([fdo#109271]) +103 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-pnv-d510/igt@kms_color@pipe-d-ctm-red-to-blue.html

  * igt@kms_color@pipe-d-gamma:
    - fi-ivb-3770:        NOTRUN -> [SKIP][43] ([fdo#109271]) +66 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ivb-3770/igt@kms_color@pipe-d-gamma.html

  * igt@kms_color@pipe-d-invalid-ctm-matrix-sizes:
    - fi-glk-j4005:       NOTRUN -> [SKIP][44] ([fdo#109271]) +66 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-glk-j4005/igt@kms_color@pipe-d-invalid-ctm-matrix-sizes.html

  * igt@kms_color@pipe-d-invalid-degamma-lut-sizes:
    - fi-hsw-4770:        NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#533]) +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@kms_color@pipe-d-invalid-degamma-lut-sizes.html

  * igt@kms_color@pipe-d-invalid-gamma-lut-sizes:
    - fi-rkl-guc:         NOTRUN -> [SKIP][46] ([i915#4070] / [i915#533]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-rkl-guc/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html

  * {igt@kms_color@pipe-d-plane-ctm-0-75} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][47] ([fdo#109271]) +103 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-elk-e7500/igt@kms_color@pipe-d-plane-ctm-0-75.html

  * {igt@kms_color@pipe-d-plane-ctm-green-to-red} (NEW):
    - fi-bsw-kefka:       NOTRUN -> [SKIP][48] ([fdo#109271]) +80 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-kefka/igt@kms_color@pipe-d-plane-ctm-green-to-red.html

  * {igt@kms_color@pipe-d-plane-gamma} (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271]) +66 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-cfl-guc/igt@kms_color@pipe-d-plane-gamma.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][50] ([fdo#109271] / [i915#4312] / [i915#5594])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-rpls-2}:       [DMESG-WARN][51] ([i915#4391]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - {fi-ehl-2}:         [DMESG-WARN][53] ([i915#5122]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       [INCOMPLETE][55] ([i915#5329]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@i915_module_load@reload.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [INCOMPLETE][57] ([i915#2940] / [i915#5801]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][59] ([i915#3921]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5329]: https://gitlab.freedesktop.org/drm/intel/issues/5329
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#5692]: https://gitlab.freedesktop.org/drm/intel/issues/5692
  [i915#5801]: https://gitlab.freedesktop.org/drm/intel/issues/5801


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6467 -> IGTPW_7048

  CI-20190529: 20190529
  CI_DRM_11614: b34f19b38e76292c5ac846fb9a8d4d0c4036dd78 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7048: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/index.html
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 138 lines
--- 0 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/index.html

--===============5840416303682568918==
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
<tr><td><b>Series:</b></td><td>Add IGT support for plane color management (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96895/">https://patchwork.freedesktop.org/series/96895/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11614 -&gt; IGTPW_7048</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/index.html</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Missing    (5): fi-kbl-soraka fi-bsw-cyan fi-icl-u2 bat-adlp-4 bat-jsl-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7048:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes} (NEW):</p>
<ul>
<li>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-adl-ddr5/igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-tgl-dsi/igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-gamma} (NEW):</p>
<ul>
<li>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@kms_color@pipe-a-plane-gamma.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-invalid-plane-gamma-lut-sizes} (NEW):</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-adln-1/igt@kms_color@pipe-b-invalid-plane-gamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-plane-ctm-0-50} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-tgl-1115g4/igt@kms_color@pipe-b-plane-ctm-0-50.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes} (NEW):</p>
<ul>
<li>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-jsl-1/igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-1/igt@kms_color@pipe-c-plane-ctm-red-to-blue.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-adlp-6/igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes.html">SKIP</a> +51 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-adln-1/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11614 and IGTPW_7048:</p>
<h3>New IGT tests (52)</h3>
<ul>
<li>
<p>igt@kms_color@pipe-a-invalid-plane-ctm-matrix-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-invalid-plane-degamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
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
<li>Exec time: [0.0] s</li>
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
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-degamma:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-plane-gamma:</p>
<ul>
<li>Statuses : 35 skip(s)</li>
<li>Exec time: [0.0] s</li>
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
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-plane-ctm-red-to-blue:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
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
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-invalid-plane-gamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-0-25:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-0-50:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-0-75:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-blue-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-green-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-max:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-negative:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-ctm-red-to-blue:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-degamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-plane-gamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-plane-ctm-matrix-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-plane-degamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-plane-gamma-lut-sizes:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-0-25:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-0-50:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-0-75:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-blue-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-green-to-red:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-max:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-negative:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-ctm-red-to-blue:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-degamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-plane-gamma:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7048 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bdw-5557u/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bdw-5557u/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5692">i915#5692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-n3050/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-7567u/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-guc/igt@kms_color@pipe-a-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-blue-to-red} (NEW):</p>
<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-7500u/igt@kms_color@pipe-a-plane-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-negative} (NEW):</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-blb-e6850/igt@kms_color@pipe-a-plane-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bwr-2160/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ehl-2/igt@kms_color@pipe-a-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +51 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-plane-degamma} (NEW):</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-skl-6700k2/igt@kms_color@pipe-a-plane-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-n3050/igt@kms_color@pipe-a-plane-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +92 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-negative:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ilk-650/igt@kms_color@pipe-b-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bdw-5557u/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-skl-guc/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-g3258/igt@kms_color@pipe-b-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +51 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-plane-ctm-red-to-blue} (NEW):</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-rkl-guc/igt@kms_color@pipe-b-plane-ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2600/igt@kms_color@pipe-c-degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2520m/igt@kms_color@pipe-c-invalid-plane-ctm-matrix-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes} (NEW):</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +51 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bxt-dsi/igt@kms_color@pipe-c-invalid-plane-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-max} (NEW):</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bdw-gvtdvm/igt@kms_color@pipe-c-plane-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-plane-ctm-negative} (NEW):</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-cfl-8109u/igt@kms_color@pipe-c-plane-ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-cfl-8700k/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-g3258/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +14 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-kbl-8809g/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +102 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-rkl-guc/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-pnv-d510/igt@kms_color@pipe-d-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-gamma:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ivb-3770/igt@kms_color@pipe-d-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-ctm-matrix-sizes:</p>
<ul>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-glk-j4005/igt@kms_color@pipe-d-invalid-ctm-matrix-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-degamma-lut-sizes:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@kms_color@pipe-d-invalid-degamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-invalid-gamma-lut-sizes:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-rkl-guc/igt@kms_color@pipe-d-invalid-gamma-lut-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-0-75} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-elk-e7500/igt@kms_color@pipe-d-plane-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +103 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-ctm-green-to-red} (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-kefka/igt@kms_color@pipe-d-plane-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +80 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-plane-gamma} (NEW):</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-cfl-guc/igt@kms_color@pipe-d-plane-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-ehl-2/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/bat-rpls-2/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5329">i915#5329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/bat-rpls-2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5801">i915#5801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11614/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6467 -&gt; IGTPW_7048</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11614: b34f19b38e76292c5ac846fb9a8d4d0c4036dd78 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7048: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7048/index.html<br />
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 138 lines<br />
--- 0 lines</p>

</body>
</html>

--===============5840416303682568918==--
