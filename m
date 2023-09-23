Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7427122597503366646=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Sat, 23 Sep 2023 00:04:45 -0000
Message-ID: <169542748576.3504.5958271472281764778@emeril.freedesktop.org>
References: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Update_I?=
 =?utf-8?q?GT_tests_to_support_new_engine_busyness_interface?=
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

--===============7427122597503366646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update IGT tests to support new engine busyness interface
URL   : https://patchwork.freedesktop.org/series/124147/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7499_BAT -> XEIGTPW_9858_BAT
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

  Here are the changes found in XEIGTPW_9858_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-atsm-2:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9858/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7499 -> IGTPW_9858
  * Linux: xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec -> xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625

  IGTPW_9858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9858/index.html
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec: 6149acb947f2f8b65ee1a058982a5d6fce3124ec
  xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625: 16e2c940ef53f81b2c68e16ec39cf5772894a625

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9858/index.html

--===============7427122597503366646==
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
<tr><td><b>Series:</b></td><td>Update IGT tests to support new engine busyness interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124147/">https://patchwork.freedesktop.org/series/124147/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9858/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9858/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7499_BAT -&gt; XEIGTPW_9858_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9858_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7499/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9858/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7499 -&gt; IGTPW_9858</li>
<li>Linux: xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec -&gt; xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625</li>
</ul>
<p>IGTPW_9858: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9858/index.html<br />
  IGT_7499: d991240f6c6751e9480456c20de785cfc6e6ff15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-390-6149acb947f2f8b65ee1a058982a5d6fce3124ec: 6149acb947f2f8b65ee1a058982a5d6fce3124ec<br />
  xe-392-16e2c940ef53f81b2c68e16ec39cf5772894a625: 16e2c940ef53f81b2c68e16ec39cf5772894a625</p>

</body>
</html>

--===============7427122597503366646==--
