Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0126698191118078390=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 30 Nov 2023 14:11:00 -0000
Message-ID: <170135346045.15646.13126839786651410908@emeril.freedesktop.org>
References: <20231130111735.435263-1-matthew.auld@intel.com>
In-Reply-To: <20231130111735.435263-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_s?=
 =?utf-8?q?tarting_with_=5Bi-g-t=2C1/2=5D_tests/intel/xe=5Fcreate=3A_sanit?=
 =?utf-8?q?y_check_all_MBZ_fields?=
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

--===============0126698191118078390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/intel/xe_create: sanity check all MBZ fields
URL   : https://patchwork.freedesktop.org/series/127114/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7612_BAT -> XEIGTPW_10302_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10302_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_create@create-invalid-mbz} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-atsm-2/igt@xe_create@create-invalid-mbz.html
    - bat-pvc-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-pvc-2/igt@xe_create@create-invalid-mbz.html
    - bat-adlp-7:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-adlp-7/igt@xe_create@create-invalid-mbz.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-dg2-oem2/igt@xe_create@create-invalid-mbz.html

  
New tests
---------

  New tests have been introduced between XEIGT_7612_BAT and XEIGTPW_10302_BAT:

### New IGT tests (1) ###

  * igt@xe_create@create-invalid-mbz:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10302_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][5] ([i915#2346]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7612 -> IGTPW_10302

  IGTPW_10302: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10302/index.html
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/index.html

--===============0126698191118078390==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/intel/xe_create: sanity check all MBZ fields</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127114/">https://patchwork.freedesktop.org/series/127114/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7612_BAT -&gt; XEIGTPW_10302_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10302_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_create@create-invalid-mbz} (NEW):</p>
<ul>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-atsm-2/igt@xe_create@create-invalid-mbz.html">FAIL</a></p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-pvc-2/igt@xe_create@create-invalid-mbz.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-adlp-7/igt@xe_create@create-invalid-mbz.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-dg2-oem2/igt@xe_create@create-invalid-mbz.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7612_BAT and XEIGTPW_10302_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_create@create-invalid-mbz:<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10302_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7612/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10302/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7612 -&gt; IGTPW_10302</li>
</ul>
<p>IGTPW_10302: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10302/index.html<br />
  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-538-afdc645350a4b30d1ba6c52deed4ecc11bf7c083: afdc645350a4b30d1ba6c52deed4ecc11bf7c083</p>

</body>
</html>

--===============0126698191118078390==--
