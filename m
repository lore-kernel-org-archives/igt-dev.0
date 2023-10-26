Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8679891460157536720=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse Zhang" <jesse.zhang@amd.com>
Date: Thu, 26 Oct 2023 04:48:40 -0000
Message-ID: <169829572018.20471.11719518289408359501@emeril.freedesktop.org>
References: <20231026030545.751790-1-jesse.zhang@amd.com>
In-Reply-To: <20231026030545.751790-1-jesse.zhang@amd.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/am?=
 =?utf-8?q?d=5Fsecurity=3A_add_secure_write_test_for_gfx_=28rev2=29?=
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

--===============8679891460157536720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amd_security: add secure write test for gfx (rev2)
URL   : https://patchwork.freedesktop.org/series/125534/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7557_BAT -> XEIGTPW_10068_BAT
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

  Here are the changes found in XEIGTPW_10068_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10068/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][3] ([Intel XE#282]) -> [FAIL][4] ([Intel XE#616] / [Intel XE#750])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10068/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750


Build changes
-------------

  * IGT: IGT_7557 -> IGTPW_10068
  * Linux: xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3 -> xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df

  IGTPW_10068: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10068/index.html
  IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3: bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3
  xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df: 4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10068/index.html

--===============8679891460157536720==
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
<tr><td><b>Series:</b></td><td>tests/amd_security: add secure write test for gfx (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125534/">https://patchwork.freedesktop.org/series/125534/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10068/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10068/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7557_BAT -&gt; XEIGTPW_10068_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10068_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10068/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7557/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10068/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7557 -&gt; IGTPW_10068</li>
<li>Linux: xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3 -&gt; xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df</li>
</ul>
<p>IGTPW_10068: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10068/index.html<br />
  IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-446-bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3: bbcc0af8b09bb7f275f8d2d6e55eeec9c74281c3<br />
  xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df: 4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df</p>

</body>
</html>

--===============8679891460157536720==--
