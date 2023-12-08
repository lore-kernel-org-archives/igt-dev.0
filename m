Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4638917587752975315=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fwaitfence=3A_?=
 =?utf-8?q?Add_test_to_verify_if_mask_is_checked?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 08 Dec 2023 18:01:05 -0000
Message-ID: <170205846523.7326.10446705936468439828@emeril.freedesktop.org>
References: <20231208153738.7-1-francois.dugast@intel.com>
In-Reply-To: <20231208153738.7-1-francois.dugast@intel.com>
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

--===============4638917587752975315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_waitfence: Add test to verify if mask is checked
URL   : https://patchwork.freedesktop.org/series/127573/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7629_BAT -> XEIGTPW_10384_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10384_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] ([Intel XE#524])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Possible fixes ####

  * {igt@xe_gt_freq@freq_basic_api}:
    - bat-adlp-7:         [FAIL][3] -> [PASS][4] +2 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
    - bat-dg2-oem2:       [FAIL][5] -> [PASS][6] +2 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html
    - bat-pvc-2:          [FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html

  * {igt@xe_gt_freq@freq_fixed_idle}:
    - bat-atsm-2:         [FAIL][9] -> [PASS][10] +2 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7629 -> IGTPW_10384
  * Linux: xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072 -> xe-563-4571c8c1bb64c926d82f792918da760d8af8ebd8

  IGTPW_10384: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10384/index.html
  IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072: 61789dd6d716fdb2ad639ddcc1d88856b6e55072
  xe-563-4571c8c1bb64c926d82f792918da760d8af8ebd8: 4571c8c1bb64c926d82f792918da760d8af8ebd8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/index.html

--===============4638917587752975315==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_waitfence: Add test to verify if mask is checked</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127573/">https://patchwork.freedesktop.org/series/127573/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7629_BAT -&gt; XEIGTPW_10384_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10384_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-leak:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@xe_gt_freq@freq_basic_api}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> +2 other tests pass</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> +2 other tests pass</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_fixed_idle}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7629/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10384/bat-atsm-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7629 -&gt; IGTPW_10384</li>
<li>Linux: xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072 -&gt; xe-563-4571c8c1bb64c926d82f792918da760d8af8ebd8</li>
</ul>
<p>IGTPW_10384: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10384/index.html<br />
  IGT_7629: 1dd73105a01e092da7954f9552ec0c67ed8a9f4e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-562-61789dd6d716fdb2ad639ddcc1d88856b6e55072: 61789dd6d716fdb2ad639ddcc1d88856b6e55072<br />
  xe-563-4571c8c1bb64c926d82f792918da760d8af8ebd8: 4571c8c1bb64c926d82f792918da760d8af8ebd8</p>

</body>
</html>

--===============4638917587752975315==--
