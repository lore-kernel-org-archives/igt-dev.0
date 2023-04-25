Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4820542927530176818=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Tue, 25 Apr 2023 20:54:54 -0000
Message-ID: <168245609472.25939.5018033787476572172@emeril.freedesktop.org>
References: <20230425162405.1730513-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20230425162405.1730513-1-vinay.belgaumkar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?slpc=3A_Add_basic_IGT_test_=28rev8=29?=
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

--===============4820542927530176818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/slpc: Add basic IGT test (rev8)
URL   : https://patchwork.freedesktop.org/series/115698/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7271 -> IGTPW_8858
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8858 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8858, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html

Participating hosts (39 -> 38)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8858:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pm_freq_api@freq-basic-api} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html
    - bat-jsl-1:          NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html

  * {igt@i915_pm_freq_api@freq-reset} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html
    - bat-adls-5:         NOTRUN -> [SKIP][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rps@basic-api:
    - {bat-mtlp-8}:       [FAIL][8] ([i915#8346]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_pm_rps@basic-api.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@slpc:
    - {bat-mtlp-8}:       NOTRUN -> [FAIL][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  
New tests
---------

  New tests have been introduced between IGT_7271 and IGTPW_8858:

### New IGT tests (6) ###

  * igt@i915_pm_freq_api@freq-basic-api:
    - Statuses : 25 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-basic-api@gt0:
    - Statuses : 13 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-basic-api@gt1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-reset:
    - Statuses : 25 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-reset@gt0:
    - Statuses : 13 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_freq_api@freq-reset@gt1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8858 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@i915_pm_freq_api@freq-basic-api} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][11] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-skl-guc:         NOTRUN -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][13] ([fdo#109271]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][14] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][16] ([fdo#109271]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][17] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][19] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][21] ([fdo#109271]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-ilk-650:         NOTRUN -> [SKIP][22] ([fdo#109271]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][23] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][25] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html

  * {igt@i915_pm_freq_api@freq-reset} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-blb-e6850/igt@i915_pm_freq_api@freq-reset.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][27] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][29] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html
    - fi-apl-guc:         NOTRUN -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-7:          [PASS][31] -> [SKIP][32] ([i915#6621])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-7/igt@i915_pm_rps@basic-api.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-7/igt@i915_pm_rps@basic-api.html
    - bat-adlp-9:         [PASS][33] -> [SKIP][34] ([i915#6621])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-9/igt@i915_pm_rps@basic-api.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-9/igt@i915_pm_rps@basic-api.html
    - bat-adlp-6:         [PASS][35] -> [SKIP][36] ([i915#6621])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-6/igt@i915_pm_rps@basic-api.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-6/igt@i915_pm_rps@basic-api.html
    - bat-rplp-1:         [PASS][37] -> [SKIP][38] ([i915#6621])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rplp-1/igt@i915_pm_rps@basic-api.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rplp-1/igt@i915_pm_rps@basic-api.html
    - bat-dg1-5:          [PASS][39] -> [SKIP][40] ([i915#6621])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-5/igt@i915_pm_rps@basic-api.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-5/igt@i915_pm_rps@basic-api.html
    - bat-atsm-1:         [PASS][41] -> [SKIP][42] ([i915#6621])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-atsm-1/igt@i915_pm_rps@basic-api.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-atsm-1/igt@i915_pm_rps@basic-api.html
    - bat-dg2-9:          [PASS][43] -> [SKIP][44] ([i915#6621])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-9/igt@i915_pm_rps@basic-api.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-9/igt@i915_pm_rps@basic-api.html
    - bat-dg2-11:         [PASS][45] -> [SKIP][46] ([i915#6621])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@i915_pm_rps@basic-api.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@i915_pm_rps@basic-api.html
    - bat-adln-1:         [PASS][47] -> [SKIP][48] ([i915#6621])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_pm_rps@basic-api.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_pm_rps@basic-api.html
    - bat-dg2-8:          [PASS][49] -> [SKIP][50] ([i915#6621])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@i915_pm_rps@basic-api.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@i915_pm_rps@basic-api.html
    - bat-adlm-1:         [PASS][51] -> [SKIP][52] ([i915#6621])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlm-1/igt@i915_pm_rps@basic-api.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlm-1/igt@i915_pm_rps@basic-api.html
    - bat-rpls-1:         [PASS][53] -> [SKIP][54] ([i915#6621])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_pm_rps@basic-api.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adln-1:         [PASS][55] -> [INCOMPLETE][56] ([i915#7609])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_selftest@live@gt_lrc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [PASS][57] -> [ABORT][58] ([i915#8384])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_selftest@live@reset.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][59] -> [FAIL][60] ([i915#7932])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-11:         NOTRUN -> [SKIP][61] ([i915#5354])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-8}:       [ABORT][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-tgl-1115g4:      [INCOMPLETE][64] -> [INCOMPLETE][65] ([i915#7443])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#8346]: https://gitlab.freedesktop.org/drm/intel/issues/8346
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7271 -> IGTPW_8858

  CI-20190529: 20190529
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html
  IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_freq_api@freq-basic-api
+igt@i915_pm_freq_api@freq-reset

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html

--===============4820542927530176818==
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
<tr><td><b>Series:</b></td><td>tests/slpc: Add basic IGT test (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115698/">https://patchwork.freedesktop.org/series/115698/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7271 -&gt; IGTPW_8858</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8858 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8858, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8858:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-3/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-jsl-1/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-rkl-11600/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adls-5/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8346">i915#8346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@slpc.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7271 and IGTPW_8858:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api@gt0:</p>
<ul>
<li>Statuses : 13 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api@gt1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>Statuses : 25 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset@gt0:</p>
<ul>
<li>Statuses : 13 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset@gt1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8858 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@i915_pm_freq_api@freq-basic-api} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-glk-j4005/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-soraka/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8109u/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-7567u/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-8700k/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-8809g/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ivb-3770/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-elk-e7500/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-nick/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-ilk-650/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-cfl-guc/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-kbl-x1275/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-hsw-4770/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_freq_api@freq-reset} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-blb-e6850/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-bsw-n3050/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-kbl-2/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-skl-6600u/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-apl-guc/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-7/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-7/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-9/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlp-6/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rplp-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rplp-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg1-5/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg1-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-atsm-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-atsm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-9/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-11/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adlm-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adlm-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_pm_rps@basic-api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-adln-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>{bat-mtlp-8}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7271/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7271 -&gt; IGTPW_8858</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13062: 5a0333cf630a335d7e8f60fd2b8526ed0895900c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8858/index.html<br />
  IGT_7271: d12d7eb92226e14745a80e6bdd95384913a43548 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_freq_api@freq-basic-api<br />
+igt@i915_pm_freq_api@freq-reset</p>

</body>
</html>

--===============4820542927530176818==--
