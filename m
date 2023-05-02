Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5207372394763830955=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Tue, 02 May 2023 09:18:05 -0000
Message-ID: <168301908559.18871.5969704482240194066@emeril.freedesktop.org>
References: <20230502084507.1412747-1-jeevan.b@intel.com>
In-Reply-To: <20230502084507.1412747-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRE8gTk9U?=
 =?utf-8?q?_MERGE=3A_NV12_Experiment?=
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

--===============5207372394763830955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DO NOT MERGE: NV12 Experiment
URL   : https://patchwork.freedesktop.org/series/117190/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13078 -> IGTPW_8894
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8894 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8894, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8894:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - bat-adlp-6:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-dg1-5:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-dg2-11:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-rplp-1:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rplp-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-adls-5:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adls-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-dg2-9:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-adln-1:         NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adln-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-dg2-8:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-tgl-1115g4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html

  * {igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue} (NEW):
    - fi-cfl-8109u:       NOTRUN -> [FAIL][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8109u/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue.html
    - bat-dg2-8:          NOTRUN -> [FAIL][12] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-8/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue.html

  * {igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-3-blue} (NEW):
    - bat-dg2-9:          NOTRUN -> [FAIL][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-9/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-3-blue.html

  * {igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-edp-1-blue} (NEW):
    - bat-rplp-1:         NOTRUN -> [FAIL][14] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rplp-1/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-edp-1-blue.html

  * {igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-1-blue} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [FAIL][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8700k/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-1-blue.html

  * {igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue} (NEW):
    - fi-ivb-3770:        NOTRUN -> [FAIL][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ivb-3770/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue.html
    - fi-ilk-650:         NOTRUN -> [FAIL][17] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ilk-650/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][18] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-blb-e6850/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue.html

  * {igt@kms_pipe_crc_basic@nv12-check-green} (NEW):
    - bat-dg1-7:          NOTRUN -> [SKIP][19] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-7/igt@kms_pipe_crc_basic@nv12-check-green.html

  * {igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-1-green} (NEW):
    - fi-apl-guc:         NOTRUN -> [FAIL][20] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-apl-guc/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-1-green.html

  * {igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green} (NEW):
    - bat-jsl-3:          NOTRUN -> [FAIL][21] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-3/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green.html
    - bat-adln-1:         NOTRUN -> [FAIL][22] +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adln-1/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green.html
    - {bat-mtlp-8}:       NOTRUN -> [FAIL][23] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-8/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green.html

  * {igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green} (NEW):
    - fi-elk-e7500:       NOTRUN -> [FAIL][24] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-elk-e7500/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][25] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-rkl-11600/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][26] +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-tgl-1115g4/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][27] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-guc/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html

  * {igt@kms_pipe_crc_basic@nv12-check-red} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][28] +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-atsm-1/igt@kms_pipe_crc_basic@nv12-check-red.html
    - bat-adlm-1:         NOTRUN -> [SKIP][29] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlm-1/igt@kms_pipe_crc_basic@nv12-check-red.html
    - bat-rpls-1:         NOTRUN -> [SKIP][30] +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_pipe_crc_basic@nv12-check-red.html
    - {bat-mtlp-6}:       NOTRUN -> [SKIP][31] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-6/igt@kms_pipe_crc_basic@nv12-check-red.html

  * {igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-1-red} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [FAIL][32] +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-7567u/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-1-red.html

  * {igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red} (NEW):
    - bat-jsl-1:          NOTRUN -> [FAIL][33] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-1/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html
    - bat-adlp-6:         NOTRUN -> [FAIL][34] +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlp-6/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][35] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-6600u/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html
    - bat-adls-5:         NOTRUN -> [FAIL][36] +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adls-5/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html

  * {igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red} (NEW):
    - fi-glk-j4005:       NOTRUN -> [FAIL][37] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-glk-j4005/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red.html
    - fi-skl-guc:         NOTRUN -> [FAIL][38] +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-guc/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red.html
    - bat-dg1-5:          NOTRUN -> [FAIL][39] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-5/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red.html

  * {igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-3-red} (NEW):
    - bat-dg2-11:         NOTRUN -> [FAIL][40] +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-11/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-3-red.html

  * {igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-vga-1-red} (NEW):
    - fi-hsw-4770:        NOTRUN -> [FAIL][41] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-hsw-4770/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-vga-1-red.html

  * {igt@kms_pipe_crc_basic@nv12-check-red@pipe-c-hdmi-a-2-red} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [FAIL][42] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-bsw-n3050/igt@kms_pipe_crc_basic@nv12-check-red@pipe-c-hdmi-a-2-red.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - bat-rpls-1:         [SKIP][43] ([i915#1845]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-dg1-7:          [SKIP][45] ([i915#1845] / [i915#4078]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-adlm-1:         [SKIP][47] ([i915#1845]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-adlm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - {bat-mtlp-6}:       [SKIP][49] ([i915#1845] / [i915#4078]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-mtlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - {bat-mtlp-8}:       NOTRUN -> [SKIP][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13078 and IGTPW_8894:

### New IGT tests (27) ###

  * igt@kms_pipe_crc_basic@nv12-check-blue:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-3-blue:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-edp-1-blue:
    - Statuses : 8 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-1-blue:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-2-blue:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-3-blue:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-blue@pipe-c-hdmi-a-2-blue:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-1-green:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-3-green:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green:
    - Statuses : 8 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-2-green:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-3-green:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-vga-1-green:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-green@pipe-c-hdmi-a-2-green:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red:
    - Statuses : 10 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-1-red:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-3-red:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red:
    - Statuses : 8 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-1-red:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-3-red:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-vga-1-red:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@nv12-check-red@pipe-c-hdmi-a-2-red:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8894 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-rpls-1:         NOTRUN -> [SKIP][52] ([i915#7828])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - fi-blb-e6850:       NOTRUN -> [SKIP][53] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-blb-e6850/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][54] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][55] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-apl-guc:         NOTRUN -> [SKIP][56] ([fdo#109271])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-apl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][57] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-glk-j4005/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-skl-guc:         NOTRUN -> [SKIP][58] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][59] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][60] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][61] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-jsl-3:          NOTRUN -> [SKIP][62] ([fdo#112080])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][63] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][64] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][65] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][66] ([fdo#109271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - fi-ilk-650:         NOTRUN -> [SKIP][67] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html
    - bat-jsl-1:          NOTRUN -> [SKIP][68] ([fdo#112080])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][69] -> [FAIL][70] ([i915#7932]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  * {igt@kms_pipe_crc_basic@nv12-check-blue} (NEW):
    - fi-bsw-nick:        NOTRUN -> [SKIP][71] ([fdo#109271]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-bsw-nick/igt@kms_pipe_crc_basic@nv12-check-blue.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][72] ([fdo#109271]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-kbl-2/igt@kms_pipe_crc_basic@nv12-check-blue.html

  * {igt@kms_pipe_crc_basic@nv12-check-red} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [SKIP][73] ([fdo#109271]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-x1275/igt@kms_pipe_crc_basic@nv12-check-red.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][74] ([fdo#109271]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-8809g/igt@kms_pipe_crc_basic@nv12-check-red.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][75] ([fdo#109271]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-guc/igt@kms_pipe_crc_basic@nv12-check-red.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-1:         NOTRUN -> [SKIP][76] ([i915#1845])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         [ABORT][77] ([i915#6687] / [i915#7978] / [i915#8407]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@migrate:
    - bat-atsm-1:         [DMESG-FAIL][79] ([i915#7699] / [i915#7913]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-atsm-1/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-8}:       [ABORT][81] ([i915#4983] / [i915#7920]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8407]: https://gitlab.freedesktop.org/drm/intel/issues/8407


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7277 -> IGTPW_8894

  CI-20190529: 20190529
  CI_DRM_13078: 59c67d4cf8b737c0c25649091a1a22809d6a06f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8894: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/index.html
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+++ 7 lines
--- 98 lines

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/index.html

--===============5207372394763830955==
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
<tr><td><b>Series:</b></td><td>DO NOT MERGE: NV12 Experiment</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117190/">https://patchwork.freedesktop.org/series/117190/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13078 -&gt; IGTPW_8894</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8894 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8894, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8894:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-11/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rplp-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-rkl-11600/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adls-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-9/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adln-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-tgl-1115g4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue} (NEW):</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8109u/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-8/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-3-blue} (NEW):</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-9/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-3-blue.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-edp-1-blue} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rplp-1/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-edp-1-blue.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-1-blue} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8700k/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-1-blue.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue} (NEW):</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ivb-3770/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ilk-650/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-blb-e6850/igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-green} (NEW):</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-7/igt@kms_pipe_crc_basic@nv12-check-green.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-1-green} (NEW):</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-apl-guc/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-1-green.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-3/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adln-1/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-8/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green} (NEW):</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-elk-e7500/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-rkl-11600/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-tgl-1115g4/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-guc/igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-atsm-1/igt@kms_pipe_crc_basic@nv12-check-red.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlm-1/igt@kms_pipe_crc_basic@nv12-check-red.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_pipe_crc_basic@nv12-check-red.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-mtlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-6/igt@kms_pipe_crc_basic@nv12-check-red.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-1-red} (NEW):</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-7567u/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-1-red.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red} (NEW):</p>
<ul>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-1/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlp-6/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-6600u/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adls-5/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-glk-j4005/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-guc/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-5/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-3-red} (NEW):</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-11/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-3-red.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-vga-1-red} (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-hsw-4770/igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-vga-1-red.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red@pipe-c-hdmi-a-2-red} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-bsw-n3050/igt@kms_pipe_crc_basic@nv12-check-red@pipe-c-hdmi-a-2-red.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-adlm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-adlm-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>
<p>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-mtlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
<li>
<p>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13078 and IGTPW_8894:</p>
<h3>New IGT tests (27)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-1-blue:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-dp-3-blue:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-edp-1-blue:</p>
<ul>
<li>Statuses : 8 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-1-blue:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-2-blue:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-hdmi-a-3-blue:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-a-vga-1-blue:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-blue@pipe-c-hdmi-a-2-blue:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-1-green:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-dp-3-green:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-edp-1-green:</p>
<ul>
<li>Statuses : 8 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-1-green:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-2-green:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-hdmi-a-3-green:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-a-vga-1-green:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-green@pipe-c-hdmi-a-2-green:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red:</p>
<ul>
<li>Statuses : 10 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-1-red:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-dp-3-red:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-edp-1-red:</p>
<ul>
<li>Statuses : 8 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-1-red:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-2-red:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-hdmi-a-3-red:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-a-vga-1-red:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nv12-check-red@pipe-c-hdmi-a-2-red:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8894 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-blb-e6850/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-bsw-n3050/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-6600u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-apl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-glk-j4005/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-skl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-7567u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-ilk-650/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-jsl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-blue} (NEW):</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-bsw-nick/igt@kms_pipe_crc_basic@nv12-check-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-kbl-2/igt@kms_pipe_crc_basic@nv12-check-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pipe_crc_basic@nv12-check-red} (NEW):</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-x1275/igt@kms_pipe_crc_basic@nv12-check-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-8809g/igt@kms_pipe_crc_basic@nv12-check-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/fi-kbl-guc/igt@kms_pipe_crc_basic@nv12-check-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8407">i915#8407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-atsm-1/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13078/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7277 -&gt; IGTPW_8894</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13078: 59c67d4cf8b737c0c25649091a1a22809d6a06f8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8894: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8894/index.html<br />
  IGT_7277: 1cb3507f3ff28d11bd5cfabcde576fe78ddab571 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+++ 7 lines<br />
--- 98 lines</p>

</body>
</html>

--===============5207372394763830955==--
