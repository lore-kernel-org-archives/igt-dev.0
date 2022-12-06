Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4854285755928322686=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 06 Dec 2022 08:09:13 -0000
Message-ID: <167031415333.3375.147648710266053903@emeril.freedesktop.org>
References: <20221206073908.24332-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221206073908.24332-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgRXhlcmNp?=
 =?utf-8?q?se_evict-flink-*_=28rev3=29?=
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

--===============4854285755928322686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Exercise evict-flink-* (rev3)
URL   : https://patchwork.freedesktop.org/series/111620/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12471 -> IGTPW_8198
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8198 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8198, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/index.html

Participating hosts (44 -> 45)
------------------------------

  Additional (1): fi-hsw-4770 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8198:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_softpin@evict-flink@all} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bdw-gvtdvm/igt@gem_softpin@evict-flink@all.html
    - {bat-dg1-7}:        NOTRUN -> [FAIL][2] +6 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg1-7/igt@gem_softpin@evict-flink@all.html
    - {bat-jsl-3}:        NOTRUN -> [FAIL][3] +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-jsl-3/igt@gem_softpin@evict-flink@all.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][4] +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-rkl-guc/igt@gem_softpin@evict-flink@all.html
    - fi-skl-guc:         NOTRUN -> [FAIL][5] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-skl-guc/igt@gem_softpin@evict-flink@all.html
    - {bat-dg2-11}:       NOTRUN -> [FAIL][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg2-11/igt@gem_softpin@evict-flink@all.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][7] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-kbl-soraka/igt@gem_softpin@evict-flink@all.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][8] +5 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-skl-6700k2/igt@gem_softpin@evict-flink@all.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][9] +6 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-cfl-8109u/igt@gem_softpin@evict-flink@all.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][10] +6 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-kbl-7567u/igt@gem_softpin@evict-flink@all.html
    - {bat-adln-1}:       NOTRUN -> [FAIL][11] +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adln-1/igt@gem_softpin@evict-flink@all.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][12] +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-kbl-8809g/igt@gem_softpin@evict-flink@all.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][13] +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bsw-nick/igt@gem_softpin@evict-flink@all.html
    - {bat-adlm-1}:       NOTRUN -> [FAIL][14] +6 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlm-1/igt@gem_softpin@evict-flink@all.html

  * {igt@gem_softpin@evict-flink@bcs0} (NEW):
    - fi-adl-ddr5:        NOTRUN -> [FAIL][15] +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-adl-ddr5/igt@gem_softpin@evict-flink@bcs0.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][16] +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-cfl-guc/igt@gem_softpin@evict-flink@bcs0.html
    - {fi-ehl-2}:         NOTRUN -> [FAIL][17] +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ehl-2/igt@gem_softpin@evict-flink@bcs0.html

  * {igt@gem_softpin@evict-flink@ccs0} (NEW):
    - {bat-dg2-9}:        NOTRUN -> [FAIL][18] +11 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg2-9/igt@gem_softpin@evict-flink@ccs0.html

  * {igt@gem_softpin@evict-flink@ccs1} (NEW):
    - {bat-dg2-8}:        NOTRUN -> [FAIL][19] +11 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg2-8/igt@gem_softpin@evict-flink@ccs1.html

  * {igt@gem_softpin@evict-flink@rcs0} (NEW):
    - {bat-jsl-1}:        NOTRUN -> [FAIL][20] +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-jsl-1/igt@gem_softpin@evict-flink@rcs0.html
    - {fi-jsl-1}:         NOTRUN -> [FAIL][21] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-jsl-1/igt@gem_softpin@evict-flink@rcs0.html

  * {igt@gem_softpin@evict-flink@vcs0} (NEW):
    - fi-icl-u2:          NOTRUN -> [FAIL][22] +6 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-icl-u2/igt@gem_softpin@evict-flink@vcs0.html
    - {bat-adls-5}:       NOTRUN -> [FAIL][23] +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adls-5/igt@gem_softpin@evict-flink@vcs0.html
    - fi-apl-guc:         NOTRUN -> [FAIL][24] +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-apl-guc/igt@gem_softpin@evict-flink@vcs0.html
    - bat-dg1-5:          NOTRUN -> [FAIL][25] +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg1-5/igt@gem_softpin@evict-flink@vcs0.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][26] +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bsw-kefka/igt@gem_softpin@evict-flink@vcs0.html
    - bat-adlp-4:         NOTRUN -> [FAIL][27] +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlp-4/igt@gem_softpin@evict-flink@vcs0.html

  * {igt@gem_softpin@evict-flink@vcs1} (NEW):
    - {bat-adlp-9}:       NOTRUN -> [FAIL][28] +6 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlp-9/igt@gem_softpin@evict-flink@vcs1.html
    - bat-dg1-6:          NOTRUN -> [FAIL][29] +6 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg1-6/igt@gem_softpin@evict-flink@vcs1.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][30] +6 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-tgl-dsi/igt@gem_softpin@evict-flink@vcs1.html
    - {bat-kbl-2}:        NOTRUN -> [FAIL][31] +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-kbl-2/igt@gem_softpin@evict-flink@vcs1.html
    - {bat-rplp-1}:       NOTRUN -> [FAIL][32] +6 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-rplp-1/igt@gem_softpin@evict-flink@vcs1.html

  * {igt@gem_softpin@evict-flink@vecs0} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [FAIL][33] +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-rpls-2/igt@gem_softpin@evict-flink@vecs0.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][34] +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-glk-j4005/igt@gem_softpin@evict-flink@vecs0.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][35] +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-cfl-8700k/igt@gem_softpin@evict-flink@vecs0.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][36] +5 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-rkl-11600/igt@gem_softpin@evict-flink@vecs0.html

  * igt@meta_test@fail-result (NEW):
    - fi-ilk-650:         NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ilk-650/igt@meta_test@fail-result.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-blb-e6850/igt@meta_test@fail-result.html
    - {bat-adlp-6}:       NOTRUN -> [FAIL][39] +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlp-6/igt@meta_test@fail-result.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-pnv-d510/igt@meta_test@fail-result.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-hsw-4770/igt@meta_test@fail-result.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ivb-3770/igt@meta_test@fail-result.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-elk-e7500/igt@meta_test@fail-result.html
    - fi-snb-2600:        NOTRUN -> [FAIL][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-snb-2600/igt@meta_test@fail-result.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bsw-n3050:       [FAIL][45] ([i915#4312]) -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12471/fi-bsw-n3050/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bsw-n3050/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12471 and IGTPW_8198:

### New IGT tests (25) ###

  * igt@gem_softpin@evict-flink:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@all:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@bcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@ccs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@ccs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@ccs2:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@ccs3:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@rcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@vcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@vcs1:
    - Statuses : 18 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@vecs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink-sanity-check@vecs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@all:
    - Statuses : 37 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@bcs0:
    - Statuses : 37 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs0:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs2:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@ccs3:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@rcs0:
    - Statuses : 37 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vcs0:
    - Statuses : 37 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vcs1:
    - Statuses : 18 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vecs0:
    - Statuses : 37 fail(s)
    - Exec time: [0.0] s

  * igt@gem_softpin@evict-flink@vecs1:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@meta_test@fail-result:
    - Statuses : 44 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8198 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_softpin@evict-flink} (NEW):
    - fi-snb-2600:        NOTRUN -> [SKIP][47] ([fdo#109271]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-snb-2600/igt@gem_softpin@evict-flink.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][48] ([fdo#109271]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-blb-e6850/igt@gem_softpin@evict-flink.html

  * {igt@gem_softpin@evict-flink-sanity-check} (NEW):
    - fi-ivb-3770:        NOTRUN -> [SKIP][49] ([fdo#109271]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ivb-3770/igt@gem_softpin@evict-flink-sanity-check.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][50] ([fdo#109271]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-elk-e7500/igt@gem_softpin@evict-flink-sanity-check.html
    - fi-ilk-650:         NOTRUN -> [SKIP][51] ([fdo#109271]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ilk-650/igt@gem_softpin@evict-flink-sanity-check.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][52] ([fdo#109271]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-hsw-4770/igt@gem_softpin@evict-flink-sanity-check.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][53] ([fdo#109271]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-pnv-d510/igt@gem_softpin@evict-flink-sanity-check.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7083 -> IGTPW_8198

  CI-20190529: 20190529
  CI_DRM_12471: 7f8dc69dce0e934751fe31c01a6b6baa0c65bf23 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8198: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/index.html
  IGT_7083: c001793d5f22deb01918b6ba52af829794582df1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_softpin@evict-flink
+igt@gem_softpin@evict-flink-sanity-check

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/index.html

--===============4854285755928322686==
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
<tr><td><b>Series:</b></td><td>Exercise evict-flink-* (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111620/">https://patchwork.freedesktop.org/series/111620/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12471 -&gt; IGTPW_8198</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8198 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8198, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/index.html</p>
<h2>Participating hosts (44 -&gt; 45)</h2>
<p>Additional (1): fi-hsw-4770 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8198:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_softpin@evict-flink@all} (NEW):</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bdw-gvtdvm/igt@gem_softpin@evict-flink@all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-dg1-7}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg1-7/igt@gem_softpin@evict-flink@all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-jsl-3/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-rkl-guc/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-skl-guc/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg2-11/igt@gem_softpin@evict-flink@all.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-kbl-soraka/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-skl-6700k2/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-cfl-8109u/igt@gem_softpin@evict-flink@all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-kbl-7567u/igt@gem_softpin@evict-flink@all.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adln-1/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-kbl-8809g/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bsw-nick/igt@gem_softpin@evict-flink@all.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlm-1/igt@gem_softpin@evict-flink@all.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@bcs0} (NEW):</p>
<ul>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-adl-ddr5/igt@gem_softpin@evict-flink@bcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-cfl-guc/igt@gem_softpin@evict-flink@bcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ehl-2/igt@gem_softpin@evict-flink@bcs0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@ccs0} (NEW):</p>
<ul>
<li>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg2-9/igt@gem_softpin@evict-flink@ccs0.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@ccs1} (NEW):</p>
<ul>
<li>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg2-8/igt@gem_softpin@evict-flink@ccs1.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@rcs0} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-jsl-1/igt@gem_softpin@evict-flink@rcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-jsl-1/igt@gem_softpin@evict-flink@rcs0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@vcs0} (NEW):</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-icl-u2/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adls-5/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-apl-guc/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg1-5/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bsw-kefka/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlp-4/igt@gem_softpin@evict-flink@vcs0.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@vcs1} (NEW):</p>
<ul>
<li>
<p>{bat-adlp-9}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlp-9/igt@gem_softpin@evict-flink@vcs1.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-dg1-6/igt@gem_softpin@evict-flink@vcs1.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-tgl-dsi/igt@gem_softpin@evict-flink@vcs1.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-kbl-2/igt@gem_softpin@evict-flink@vcs1.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-rplp-1/igt@gem_softpin@evict-flink@vcs1.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink@vecs0} (NEW):</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-rpls-2/igt@gem_softpin@evict-flink@vecs0.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-glk-j4005/igt@gem_softpin@evict-flink@vecs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-cfl-8700k/igt@gem_softpin@evict-flink@vecs0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-rkl-11600/igt@gem_softpin@evict-flink@vecs0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result (NEW):</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ilk-650/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-blb-e6850/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/bat-adlp-6/igt@meta_test@fail-result.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-pnv-d510/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-hsw-4770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ivb-3770/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-elk-e7500/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-snb-2600/igt@meta_test@fail-result.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12471/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12471 and IGTPW_8198:</p>
<h3>New IGT tests (25)</h3>
<ul>
<li>
<p>igt@gem_softpin@evict-flink:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@all:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@bcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@ccs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@ccs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@ccs2:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@ccs3:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@rcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@vcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@vcs1:</p>
<ul>
<li>Statuses : 18 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@vecs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink-sanity-check@vecs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@all:</p>
<ul>
<li>Statuses : 37 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@bcs0:</p>
<ul>
<li>Statuses : 37 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs0:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs2:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@ccs3:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@rcs0:</p>
<ul>
<li>Statuses : 37 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vcs0:</p>
<ul>
<li>Statuses : 37 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vcs1:</p>
<ul>
<li>Statuses : 18 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vecs0:</p>
<ul>
<li>Statuses : 37 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-flink@vecs1:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@meta_test@fail-result:</p>
<ul>
<li>Statuses : 44 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8198 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_softpin@evict-flink} (NEW):</p>
<ul>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-snb-2600/igt@gem_softpin@evict-flink.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-blb-e6850/igt@gem_softpin@evict-flink.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@gem_softpin@evict-flink-sanity-check} (NEW):</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ivb-3770/igt@gem_softpin@evict-flink-sanity-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-elk-e7500/igt@gem_softpin@evict-flink-sanity-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-ilk-650/igt@gem_softpin@evict-flink-sanity-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-hsw-4770/igt@gem_softpin@evict-flink-sanity-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/fi-pnv-d510/igt@gem_softpin@evict-flink-sanity-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7083 -&gt; IGTPW_8198</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12471: 7f8dc69dce0e934751fe31c01a6b6baa0c65bf23 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8198: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8198/index.html<br />
  IGT_7083: c001793d5f22deb01918b6ba52af829794582df1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_softpin@evict-flink<br />
+igt@gem_softpin@evict-flink-sanity-check</p>

</body>
</html>

--===============4854285755928322686==--
