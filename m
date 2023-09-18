Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8667051418602631999=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Mon, 18 Sep 2023 11:57:06 -0000
Message-ID: <169503822647.32418.12951091054792252434@emeril.freedesktop.org>
References: <20230918075411.247122-1-swati2.sharma@intel.com>
In-Reply-To: <20230918075411.247122-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/km?=
 =?utf-8?q?s=5Fatomic=3A_Test_cleanup_and_dynamic_conversion?=
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

--===============8667051418602631999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic: Test cleanup and dynamic conversion
URL   : https://patchwork.freedesktop.org/series/123846/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7493_BAT -> XEIGTPW_9813_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9813_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9813_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9813_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-dg2-oem2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9813/bat-dg2-oem2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9813_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7493 -> IGTPW_9813
  * Linux: xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d -> xe-377-717f01815b20bde3f081a18f42f31673ce1f107f

  IGTPW_9813: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9813/index.html
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d
  xe-377-717f01815b20bde3f081a18f42f31673ce1f107f: 717f01815b20bde3f081a18f42f31673ce1f107f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9813/index.html

--===============8667051418602631999==
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
<tr><td><b>Series:</b></td><td>tests/kms_atomic: Test cleanup and dynamic conversion</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123846/">https://patchwork.freedesktop.org/series/123846/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9813/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9813/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7493_BAT -&gt; XEIGTPW_9813_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9813_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9813_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9813_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7493/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9813/bat-dg2-oem2/igt@xe_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9813_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7493 -&gt; IGTPW_9813</li>
<li>Linux: xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d -&gt; xe-377-717f01815b20bde3f081a18f42f31673ce1f107f</li>
</ul>
<p>IGTPW_9813: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9813/index.html<br />
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d<br />
  xe-377-717f01815b20bde3f081a18f42f31673ce1f107f: 717f01815b20bde3f081a18f42f31673ce1f107f</p>

</body>
</html>

--===============8667051418602631999==--
