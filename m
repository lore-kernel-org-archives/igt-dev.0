Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9028557197977897629=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 06 Dec 2023 00:13:29 -0000
Message-ID: <170182160917.26426.17368822571014765573@emeril.freedesktop.org>
References: <20231205213814.179963-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231205213814.179963-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_s?=
 =?utf-8?q?tarting_with_=5Bi-g-t=2C1/3=5D_tests/intel/xe=3A_Align_change_i?=
 =?utf-8?q?n_the_name_of_frequency_sysfs_attributes?=
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

--===============9028557197977897629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel/xe: Align change in the name of frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/127392/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7622_BAT -> XEIGTPW_10346_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-pvc-2 bat-atsm-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10346_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_gt_freq@freq_basic_api} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][1] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][2] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html

  
New tests
---------

  New tests have been introduced between XEIGT_7622_BAT and XEIGTPW_10346_BAT:

### New IGT tests (3) ###

  * igt@xe_gt_freq@freq_basic_api:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_gt_freq@freq_fixed_idle:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_gt_freq@freq_range_idle:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10346_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7622 -> IGTPW_10346
  * Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -> xe-551-176c42b6ba690d4c84e37f151e832d5520a38354

  IGTPW_10346: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10346/index.html
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b
  xe-551-176c42b6ba690d4c84e37f151e832d5520a38354: 176c42b6ba690d4c84e37f151e832d5520a38354

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/index.html

--===============9028557197977897629==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel/xe: Align change in the name of frequency sysfs attributes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127392/">https://patchwork.freedesktop.org/series/127392/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7622_BAT -&gt; XEIGTPW_10346_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-pvc-2 bat-atsm-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10346_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_gt_freq@freq_basic_api} (NEW):</p>
<ul>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7622_BAT and XEIGTPW_10346_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10346_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10346/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7622 -&gt; IGTPW_10346</li>
<li>Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -&gt; xe-551-176c42b6ba690d4c84e37f151e832d5520a38354</li>
</ul>
<p>IGTPW_10346: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10346/index.html<br />
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b<br />
  xe-551-176c42b6ba690d4c84e37f151e832d5520a38354: 176c42b6ba690d4c84e37f151e832d5520a38354</p>

</body>
</html>

--===============9028557197977897629==--
