Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7686801422478109964=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Mon, 03 Apr 2023 11:59:20 -0000
Message-ID: <168052316003.24311.16588699018229070451@emeril.freedesktop.org>
References: <20230331114924.15396-1-swati2.sharma@intel.com>
In-Reply-To: <20230331114924.15396-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fdsc=3A_Add_negativ?=
 =?utf-8?q?e_test_for_invalid_input_bpc_=28rev2=29?=
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

--===============7686801422478109964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_dsc: Add negative test for invalid input bpc (rev2)
URL   : https://patchwork.freedesktop.org/series/115937/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12957 -> IGTPW_8735
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8735 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8735, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/index.html

Participating hosts (37 -> 35)
------------------------------

  Missing    (2): fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8735:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dsc@dsc-with-invalid-bpc (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-jsl-3/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-dg2-9:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-9/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-adln-1:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adln-1/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-jsl-1:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-jsl-1/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-tgl-1115g4/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-rpls-1:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-1/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-adlp-6:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adlp-6/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-dg1-5:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg1-5/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-dg1-7:          NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg1-7/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-rpls-2:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-2/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-adlp-9:         NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adlp-9/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-dg2-11:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-11/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-rkl-11600/igt@kms_dsc@dsc-with-invalid-bpc.html
    - bat-adls-5:         NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adls-5/igt@kms_dsc@dsc-with-invalid-bpc.html

  * {igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-100bpc-xrgb8888} (NEW):
    - bat-rplp-1:         NOTRUN -> [ABORT][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rplp-1/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-100bpc-xrgb8888.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12957 and IGTPW_8735:

### New IGT tests (11) ###

  * igt@kms_dsc@dsc-with-invalid-bpc:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-100bpc-xrgb8888:
    - Statuses : 1 abort(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-1bpc-xrgb8888:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-100bpc-xrgb8888:
    - Statuses : 1 abort(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-1bpc-xrgb8888:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-b-dp-1-100bpc-xrgb8888:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-b-edp-1-100bpc-xrgb8888:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-dp-1-100bpc-xrgb8888:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-edp-1-100bpc-xrgb8888:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-dp-1-100bpc-xrgb8888:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.0] s

  * igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-edp-1-100bpc-xrgb8888:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8735 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [PASS][16] -> [DMESG-WARN][17] ([i915#8073])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         [PASS][18] -> [TIMEOUT][19] ([i915#6794])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/bat-rpls-1/igt@i915_selftest@live@mman.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-1/igt@i915_selftest@live@mman.html

  * igt@kms_dsc@dsc-with-invalid-bpc (NEW):
    - fi-cfl-guc:         NOTRUN -> [SKIP][20] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-cfl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][21] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-x1275/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][22] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-hsw-4770/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][23] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-cfl-8109u/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][24] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-8809g/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][25] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-ivb-3770/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][26] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-elk-e7500/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][27] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-ilk-650:         NOTRUN -> [SKIP][28] ([fdo#109271])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-ilk-650/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][29] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-bsw-n3050/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][30] ([fdo#109271])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-skl-6600u/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-apl-guc:         NOTRUN -> [SKIP][31] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-apl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-glk-j4005/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-skl-guc:         NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-skl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-7567u/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][35] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-cfl-8700k/igt@kms_dsc@dsc-with-invalid-bpc.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][36] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-bsw-nick/igt@kms_dsc@dsc-with-invalid-bpc.html
    - {bat-kbl-2}:        NOTRUN -> [SKIP][37] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-kbl-2/igt@kms_dsc@dsc-with-invalid-bpc.html

  * {igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-100bpc-xrgb8888} (NEW):
    - bat-dg2-8:          NOTRUN -> [ABORT][38] ([i915#7507])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-100bpc-xrgb8888.html

  * {igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-1bpc-xrgb8888} (NEW):
    - bat-dg2-8:          NOTRUN -> [DMESG-WARN][39] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-1bpc-xrgb8888.html

  * {igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-1bpc-xrgb8888} (NEW):
    - bat-rplp-1:         NOTRUN -> [DMESG-WARN][40] ([i915#1982])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rplp-1/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-1bpc-xrgb8888.html

  * {igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-dp-1-100bpc-xrgb8888} (NEW):
    - bat-dg2-8:          NOTRUN -> [DMESG-FAIL][41] ([i915#1982] / [i915#7507]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-dp-1-100bpc-xrgb8888.html

  * {igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-edp-1-100bpc-xrgb8888} (NEW):
    - bat-rplp-1:         NOTRUN -> [DMESG-FAIL][42] ([i915#1982]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rplp-1/igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-edp-1-100bpc-xrgb8888.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][43] ([i915#5354]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:
    - bat-dg2-8:          [PASS][44] -> [FAIL][45] ([i915#7932]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html

  
#### Warnings ####

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         [DMESG-FAIL][46] ([i915#6997] / [i915#7913]) -> [DMESG-FAIL][47] ([i915#6367] / [i915#7913] / [i915#7996])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/bat-rpls-2/igt@i915_selftest@live@slpc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-2/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7507]: https://gitlab.freedesktop.org/drm/intel/issues/7507
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996
  [i915#8073]: https://gitlab.freedesktop.org/drm/intel/issues/8073


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7233 -> IGTPW_8735

  CI-20190529: 20190529
  CI_DRM_12957: 72243ec74997623b2caf4be353d55876e3071bc6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8735: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/index.html
  IGT_7233: 716520b469a2745e1882780f2aabbc88eb19332c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_dsc@dsc-with-invalid-bpc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/index.html

--===============7686801422478109964==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_dsc: Add negative test for invalid input bpc (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115937/">https://patchwork.freedesktop.org/series/115937/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12957 -&gt; IGTPW_8735</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8735 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8735, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/index.html</p>
<h2>Participating hosts (37 -&gt; 35)</h2>
<p>Missing    (2): fi-snb-2520m fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8735:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-jsl-3/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-9/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adln-1/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-jsl-1/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-tgl-1115g4/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-1/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adlp-6/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg1-5/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg1-7/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-2/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adlp-9/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-11/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-rkl-11600/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-adls-5/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-100bpc-xrgb8888} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rplp-1/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-100bpc-xrgb8888.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12957 and IGTPW_8735:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 abort(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-1bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 abort(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-1bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-b-dp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-b-edp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-dp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-edp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-dp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-edp-1-100bpc-xrgb8888:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8735 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8073">i915#8073</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-invalid-bpc (NEW):</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-cfl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-x1275/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-hsw-4770/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-cfl-8109u/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-8809g/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-ivb-3770/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-elk-e7500/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-ilk-650/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-bsw-n3050/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-skl-6600u/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-apl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-glk-j4005/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-skl-guc/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-kbl-7567u/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-cfl-8700k/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/fi-bsw-nick/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>{bat-kbl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-kbl-2/igt@kms_dsc@dsc-with-invalid-bpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-100bpc-xrgb8888} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-100bpc-xrgb8888.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7507">i915#7507</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-1bpc-xrgb8888} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-dp-1-1bpc-xrgb8888.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-1bpc-xrgb8888} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rplp-1/igt@kms_dsc@dsc-with-invalid-bpc@pipe-a-edp-1-1bpc-xrgb8888.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-dp-1-100bpc-xrgb8888} (NEW):</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_dsc@dsc-with-invalid-bpc@pipe-c-dp-1-100bpc-xrgb8888.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7507">i915#7507</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-edp-1-100bpc-xrgb8888} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rplp-1/igt@kms_dsc@dsc-with-invalid-bpc@pipe-d-edp-1-100bpc-xrgb8888.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12957/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7996">i915#7996</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7233 -&gt; IGTPW_8735</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12957: 72243ec74997623b2caf4be353d55876e3071bc6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8735: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8735/index.html<br />
  IGT_7233: 716520b469a2745e1882780f2aabbc88eb19332c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_dsc@dsc-with-invalid-bpc</p>

</body>
</html>

--===============7686801422478109964==--
