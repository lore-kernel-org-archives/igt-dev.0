Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4987471346360134952=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Sat, 22 Apr 2023 01:41:37 -0000
Message-ID: <168212769711.29286.12967488643810992219@emeril.freedesktop.org>
References: <20230422010103.1028886-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20230422010103.1028886-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?slpc=3A_Add_basic_IGT_test_=28rev7=29?=
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

--===============4987471346360134952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/slpc: Add basic IGT test (rev7)
URL   : https://patchwork.freedesktop.org/series/115698/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13043 -> IGTPW_8839
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8839 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8839, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/index.html

Participating hosts (36 -> 35)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8839:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pm_freq_api@freq-basic-api} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html
    - bat-jsl-1:          NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html

  * {igt@i915_pm_freq_api@freq-reset} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html
    - bat-adls-5:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8700k:       [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - fi-rkl-11600:       [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-rkl-11600/igt@i915_pm_rps@basic-api.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-rkl-11600/igt@i915_pm_rps@basic-api.html
    - bat-adls-5:         [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adls-5/igt@i915_pm_rps@basic-api.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adls-5/igt@i915_pm_rps@basic-api.html
    - bat-jsl-3:          [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-jsl-3/igt@i915_pm_rps@basic-api.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-3/igt@i915_pm_rps@basic-api.html
    - bat-jsl-1:          [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-jsl-1/igt@i915_pm_rps@basic-api.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-1/igt@i915_pm_rps@basic-api.html
    - fi-tgl-1115g4:      [PASS][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13043 and IGTPW_8839:

### New IGT tests (4) ###

  * igt@i915_pm_freq_api@freq-basic-api:
    - Statuses : 23 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-basic-api@gt0:
    - Statuses : 11 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-reset:
    - Statuses : 23 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-reset@gt0:
    - Statuses : 11 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8839 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@i915_pm_freq_api@freq-basic-api} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-skl-guc:         NOTRUN -> [SKIP][19] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][21] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][23] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][25] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][27] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-ilk-650:         NOTRUN -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][29] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][31] ([fdo#109271]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html

  * {igt@i915_pm_freq_api@freq-reset} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][33] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html
    - fi-apl-guc:         NOTRUN -> [SKIP][35] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-7:          [PASS][36] -> [SKIP][37] ([i915#6621])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg1-7/igt@i915_pm_rps@basic-api.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg1-7/igt@i915_pm_rps@basic-api.html
    - fi-glk-j4005:       [PASS][38] -> [SKIP][39] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-glk-j4005/igt@i915_pm_rps@basic-api.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-glk-j4005/igt@i915_pm_rps@basic-api.html
    - bat-adlp-9:         [PASS][40] -> [SKIP][41] ([i915#6621])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlp-9/igt@i915_pm_rps@basic-api.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlp-9/igt@i915_pm_rps@basic-api.html
    - fi-skl-guc:         [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-skl-guc/igt@i915_pm_rps@basic-api.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-guc/igt@i915_pm_rps@basic-api.html
    - fi-cfl-8700k:       [PASS][44] -> [SKIP][45] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html
    - fi-bsw-nick:        [PASS][46] -> [SKIP][47] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-bsw-nick/igt@i915_pm_rps@basic-api.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-nick/igt@i915_pm_rps@basic-api.html
    - bat-adlp-6:         [PASS][48] -> [SKIP][49] ([i915#6621])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlp-6/igt@i915_pm_rps@basic-api.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlp-6/igt@i915_pm_rps@basic-api.html
    - bat-rplp-1:         [PASS][50] -> [SKIP][51] ([i915#6621])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-rplp-1/igt@i915_pm_rps@basic-api.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-rplp-1/igt@i915_pm_rps@basic-api.html
    - bat-dg1-5:          [PASS][52] -> [SKIP][53] ([i915#6621])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg1-5/igt@i915_pm_rps@basic-api.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg1-5/igt@i915_pm_rps@basic-api.html
    - bat-atsm-1:         [PASS][54] -> [SKIP][55] ([i915#6621])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-atsm-1/igt@i915_pm_rps@basic-api.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-atsm-1/igt@i915_pm_rps@basic-api.html
    - bat-dg2-9:          [PASS][56] -> [SKIP][57] ([i915#6621])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg2-9/igt@i915_pm_rps@basic-api.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg2-9/igt@i915_pm_rps@basic-api.html
    - fi-kbl-x1275:       [PASS][58] -> [SKIP][59] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-x1275/igt@i915_pm_rps@basic-api.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-x1275/igt@i915_pm_rps@basic-api.html
    - fi-hsw-4770:        [PASS][60] -> [SKIP][61] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-hsw-4770/igt@i915_pm_rps@basic-api.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-hsw-4770/igt@i915_pm_rps@basic-api.html
    - fi-cfl-8109u:       [PASS][62] -> [SKIP][63] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html
    - fi-kbl-7567u:       [PASS][64] -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html
    - bat-adln-1:         [PASS][66] -> [SKIP][67] ([i915#6621])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adln-1/igt@i915_pm_rps@basic-api.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adln-1/igt@i915_pm_rps@basic-api.html
    - fi-kbl-8809g:       [PASS][68] -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html
    - fi-ivb-3770:        [PASS][70] -> [SKIP][71] ([fdo#109271])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-ivb-3770/igt@i915_pm_rps@basic-api.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-ivb-3770/igt@i915_pm_rps@basic-api.html
    - bat-dg2-8:          [PASS][72] -> [SKIP][73] ([i915#6621])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg2-8/igt@i915_pm_rps@basic-api.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - fi-kbl-guc:         [PASS][74] -> [SKIP][75] ([fdo#109271])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-guc/igt@i915_pm_rps@basic-api.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-guc/igt@i915_pm_rps@basic-api.html
    - bat-adlm-1:         [PASS][76] -> [SKIP][77] ([i915#6621])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlm-1/igt@i915_pm_rps@basic-api.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlm-1/igt@i915_pm_rps@basic-api.html
    - fi-bsw-n3050:       [PASS][78] -> [SKIP][79] ([fdo#109271])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-bsw-n3050/igt@i915_pm_rps@basic-api.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-n3050/igt@i915_pm_rps@basic-api.html
    - bat-rpls-1:         [PASS][80] -> [SKIP][81] ([i915#6621])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-rpls-1/igt@i915_pm_rps@basic-api.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-rpls-1/igt@i915_pm_rps@basic-api.html
    - fi-cfl-guc:         [PASS][82] -> [SKIP][83] ([fdo#109271])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-guc/igt@i915_pm_rps@basic-api.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-guc/igt@i915_pm_rps@basic-api.html
    - fi-skl-6600u:       [PASS][84] -> [SKIP][85] ([fdo#109271])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-skl-6600u/igt@i915_pm_rps@basic-api.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-6600u/igt@i915_pm_rps@basic-api.html
    - fi-apl-guc:         [PASS][86] -> [SKIP][87] ([fdo#109271])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-apl-guc/igt@i915_pm_rps@basic-api.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-apl-guc/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [PASS][88] -> [INCOMPLETE][89] ([i915#4983] / [i915#7913])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@requests:
    - bat-rpls-1:         [PASS][90] -> [ABORT][91] ([i915#7911])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-rpls-1/igt@i915_selftest@live@requests.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-rpls-1/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7264 -> IGTPW_8839

  CI-20190529: 20190529
  CI_DRM_13043: 2fa9c266135355c9993507d7c27cc6722956bfec @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8839: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/index.html
  IGT_7264: 2f0a07378e58e5c7d7b589b39ace7e3a2317f6b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_freq_api@freq-basic-api
+igt@i915_pm_freq_api@freq-reset
-igt@kms_dirtyfb@dirtyfb-ioctl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/index.html

--===============4987471346360134952==
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
<tr><td><b>Series:</b></td><td>tests/slpc: Add basic IGT test (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115698/">https://patchwork.freedesktop.org/series/115698/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13043 -&gt; IGTPW_8839</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8839 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8839, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/index.html</p>
<h2>Participating hosts (36 -&gt; 35)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8839:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-rkl-11600/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-rkl-11600/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adls-5/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adls-5/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-jsl-3/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-3/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-jsl-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-jsl-1/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-tgl-1115g4/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13043 and IGTPW_8839:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>Statuses : 23 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api@gt0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>Statuses : 23 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset@gt0:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8839 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg1-7/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-glk-j4005/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-glk-j4005/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlp-9/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-skl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-guc/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8700k/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-bsw-nick/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-nick/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlp-6/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-rplp-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-rplp-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg1-5/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg1-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-atsm-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg2-9/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-x1275/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-x1275/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-hsw-4770/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-hsw-4770/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-8109u/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-7567u/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adln-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adln-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-8809g/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-ivb-3770/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-ivb-3770/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-dg2-8/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-kbl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-kbl-guc/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlm-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-bsw-n3050/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-bsw-n3050/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-rpls-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-rpls-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-cfl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-cfl-guc/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-skl-6600u/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-skl-6600u/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/fi-apl-guc/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/fi-apl-guc/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13043/bat-rpls-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/bat-rpls-1/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7264 -&gt; IGTPW_8839</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13043: 2fa9c266135355c9993507d7c27cc6722956bfec @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8839: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8839/index.html<br />
  IGT_7264: 2f0a07378e58e5c7d7b589b39ace7e3a2317f6b2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_freq_api@freq-basic-api<br />
+igt@i915_pm_freq_api@freq-reset<br />
-igt@kms_dirtyfb@dirtyfb-ioctl</p>

</body>
</html>

--===============4987471346360134952==--
