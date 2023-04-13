Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0879902756792177177=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Thu, 13 Apr 2023 23:45:10 -0000
Message-ID: <168142951078.3695.15544038299112744484@emeril.freedesktop.org>
References: <20230413224414.2313507-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20230413224414.2313507-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?slpc=3A_Add_basic_IGT_test_=28rev5=29?=
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

--===============0879902756792177177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/slpc: Add basic IGT test (rev5)
URL   : https://patchwork.freedesktop.org/series/115698/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13005 -> IGTPW_8802
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8802 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8802, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8802:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pm_freq_api@freq-basic-api} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html
    - bat-jsl-1:          NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html

  * {igt@i915_pm_freq_api@freq-reset} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html
    - bat-adls-5:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-7:          [PASS][6] -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg1-7/igt@i915_pm_rps@basic-api.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg1-7/igt@i915_pm_rps@basic-api.html
    - bat-rpls-2:         [PASS][8] -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-2/igt@i915_pm_rps@basic-api.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_pm_rps@basic-api.html
    - bat-adlp-9:         [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-adlp-9/igt@i915_pm_rps@basic-api.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adlp-9/igt@i915_pm_rps@basic-api.html
    - bat-adlp-6:         [PASS][12] -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-adlp-6/igt@i915_pm_rps@basic-api.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adlp-6/igt@i915_pm_rps@basic-api.html
    - bat-rplp-1:         [PASS][14] -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rplp-1/igt@i915_pm_rps@basic-api.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rplp-1/igt@i915_pm_rps@basic-api.html
    - bat-dg2-9:          [PASS][16] -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-9/igt@i915_pm_rps@basic-api.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-9/igt@i915_pm_rps@basic-api.html
    - bat-dg2-11:         [PASS][18] -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-11/igt@i915_pm_rps@basic-api.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@i915_pm_rps@basic-api.html
    - bat-adln-1:         [PASS][20] -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-adln-1/igt@i915_pm_rps@basic-api.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adln-1/igt@i915_pm_rps@basic-api.html
    - bat-dg2-8:          [PASS][22] -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-8/igt@i915_pm_rps@basic-api.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - bat-rpls-1:         [PASS][24] -> [SKIP][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-1/igt@i915_pm_rps@basic-api.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-1/igt@i915_pm_rps@basic-api.html

  
#### Warnings ####

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-5:          [FAIL][26] ([i915#8308]) -> [SKIP][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg1-5/igt@i915_pm_rps@basic-api.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg1-5/igt@i915_pm_rps@basic-api.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13005 and IGTPW_8802:

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

  Here are the changes found in IGTPW_8802 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-2:         NOTRUN -> [ABORT][28] ([i915#6687] / [i915#7978])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html
    - bat-rpls-1:         [PASS][29] -> [ABORT][30] ([i915#6687] / [i915#7978])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * {igt@i915_pm_freq_api@freq-basic-api} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][31] ([fdo#109271]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-skl-guc:         NOTRUN -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][33] ([fdo#109271]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][35] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][36] ([fdo#109271]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][37] ([fdo#109271]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][38] ([fdo#109271]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][39] ([fdo#109271]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][40] ([fdo#109271]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-ilk-650:         NOTRUN -> [SKIP][41] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][42] ([fdo#109271]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][43] ([fdo#109271]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][44] ([fdo#109271]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html

  * {igt@i915_pm_freq_api@freq-reset} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][45] ([fdo#109271]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][46] ([fdo#109271]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][47] ([fdo#109271]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html
    - fi-apl-guc:         NOTRUN -> [SKIP][48] ([fdo#109271]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-FAIL][49] ([i915#6997] / [i915#7913])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_selftest@live@slpc.html
    - bat-rpls-1:         [PASS][50] -> [DMESG-FAIL][51] ([i915#6367])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-dg2-11:         NOTRUN -> [SKIP][52] ([i915#7828])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][53] ([i915#5354])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_lrc:
    - bat-dg2-11:         [INCOMPLETE][54] ([i915#7609] / [i915#7913]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [TIMEOUT][56] ([i915#6794]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-2/igt@i915_selftest@live@mman.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-2:         [ABORT][58] ([i915#6687] / [i915#7978]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7254 -> IGTPW_8802

  CI-20190529: 20190529
  CI_DRM_13005: bf4d8875e662b5cda5aa9ce2cb978176697a60c1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8802: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/index.html
  IGT_7254: 7fab01340a3f360abacd7914015be1ad485363d7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_freq_api@freq-basic-api
+igt@i915_pm_freq_api@freq-reset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/index.html

--===============0879902756792177177==
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
<tr><td><b>Series:</b></td><td>tests/slpc: Add basic IGT test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115698/">https://patchwork.freedesktop.org/series/115698/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13005 -&gt; IGTPW_8802</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8802 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8802, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8802:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg1-7/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-2/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-adlp-9/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-adlp-6/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rplp-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rplp-1/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-9/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-11/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-adln-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-adln-1/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-8/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-1/igt@i915_pm_rps@basic-api.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rps@basic-api:<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg1-5/igt@i915_pm_rps@basic-api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8308">i915#8308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg1-5/igt@i915_pm_rps@basic-api.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13005 and IGTPW_8802:</p>
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
<p>Here are the changes found in IGTPW_8802 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13005/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/bat-rpls-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7254 -&gt; IGTPW_8802</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13005: bf4d8875e662b5cda5aa9ce2cb978176697a60c1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8802: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8802/index.html<br />
  IGT_7254: 7fab01340a3f360abacd7914015be1ad485363d7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_freq_api@freq-basic-api<br />
+igt@i915_pm_freq_api@freq-reset</p>

</body>
</html>

--===============0879902756792177177==--
